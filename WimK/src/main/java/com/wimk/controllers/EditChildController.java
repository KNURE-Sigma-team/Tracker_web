package com.wimk.controllers;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;

import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.service.ChildService;
import com.wimk.service.ParentService;
import com.wimk.utils.ImageValidator;

@Controller
@RequestMapping(value = "/edit_child")
public class EditChildController implements ServletContextAware{

	private final String DIRECTORY_CHILD_AVATARS = File.separator + "resources" + File.separator + "core"
			+ File.separator + "images" + File.separator + "child_avatars";

	private ServletContext context;

	@Autowired
	ChildService childService;

	@Autowired
	ParentService parentService;

	/*
	 * Get child of current parent and put him into the model of EditChild.jsp
	 */

	@RequestMapping(method = RequestMethod.GET)
	public String viewEditChild(HttpServletRequest request, Map<String, Object> model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Parent parent = parentService.getByLogin(login);
		List<Child> listOfChild = childService.getChildOfParent(parent);
		String childLogin = request.getParameter("child");
		Child child = null;
		for (Child c : listOfChild) {
			if (c.getLogin().equals(childLogin)) {
				child = c;
				break;
			}
		}
		model.put("child", child);
		return "EditChild";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.POST)
	public String childEditor(HttpServletRequest request, Map<String, Object> model) {
		String address = "redirect:personal_cabinet";

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Parent parent = parentService.getByLogin(login);
		List<Child> listOfChild = childService.getChildOfParent(parent);

		String status = null;
		List<FileItem> multiparts = null;
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				for (FileItem item : multiparts) {
					if (item.isFormField() && item.getFieldName().equals("status")) {
						status = item.getString();
					}
				}
			} catch (Exception ex) {
				request.setAttribute("message", "File Upload Failed due to " + ex);
			}
		} else {
			status = request.getParameter("status");
		}
		if(status == null){
			throw new RuntimeException();
		}
		switch (status) {
		case "edit":
			address = editChild(multiparts, listOfChild, model, login);
			break;
		case "remove":
			removeChild(request, listOfChild);
			break;
		}
		return address;
	}

	private String editChild(List<FileItem> multiparts, List<Child> listOfChild, Map<String, Object> model,
			String parentLogin) {
		String childLogin = null;
		String oldChildLogin = null;
		Integer sendingFrequency = null;
		FileItem avatar = null;
		for (FileItem item : multiparts) {
			if (item.isFormField()) {
				if (item.getFieldName().equals("child_login")) {
					childLogin = item.getString();
				} else if (item.getFieldName().equals("old_child_login")) {
					oldChildLogin = item.getString();
				} else if (item.getFieldName().equals("sending_frequency")) {
					sendingFrequency = Integer.parseInt(item.getString());
				}
			} else if (item.getFieldName().equals("avatar") && item.getSize() > 0) {
				if (!ImageValidator.isImage(item)) {
					model.put("bad_image", "Bad type of image.");
					return "EditChild";
				}
				avatar = item;
			}
		}
		boolean childExist = false;
		Child child = null;
		for (Child c : listOfChild) {
			if (c.getLogin().equals(childLogin)) {
				childExist = true;
			}
			if (c.getLogin().equals(oldChildLogin)) {
				child = c;
			}
		}
		if (child == null) {
			throw new RuntimeException();
		}
		if (sendingFrequency < 5 || sendingFrequency > 90) {
			model.put("child", child);
			model.put("invalid_sending_frequency", "Invalid sending frequency");
			return "EditChild";
		}
		if (!oldChildLogin.equals(childLogin) && childExist) {
			model.put("child", child);
			model.put("child_exist", "You can't have second child with same name");
			return "EditChild";
		}

		if (avatar != null) {
			try {
				File directory = new File(
						context.getRealPath("") + DIRECTORY_CHILD_AVATARS + File.separator + parentLogin);
				if (!directory.exists()) {
					directory.mkdirs();
				}
				String fileExtension = '.' + avatar.getName().split("\\.")[avatar.getName().split("\\.").length - 1];
				String filePath = DIRECTORY_CHILD_AVATARS + File.separator + parentLogin + File.separator + childLogin
						+ fileExtension;
				File oldFile = new File(context.getRealPath("") + filePath);
				oldFile.delete();
				avatar.write(new File(context.getRealPath("") + filePath));
				child.setAvatar(filePath.replace(File.separatorChar, '/'));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		child.setSendingFrequency(sendingFrequency);
		child.setLogin(childLogin);
		childService.editChild(child);
		return "redirect:personal_cabinet";
	}

	private void removeChild(HttpServletRequest request, List<Child> listOfChild) {
		String childLogin = request.getParameter("child_login");
		Child child = null;
		for (Child c : listOfChild) {
			if (c.getLogin().equals(childLogin)) {
				child = c;
				break;
			}
		}
		if (child == null) {
			throw new RuntimeException();
		}
		childService.delete(child.getId());
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.context = servletContext;
	}
}