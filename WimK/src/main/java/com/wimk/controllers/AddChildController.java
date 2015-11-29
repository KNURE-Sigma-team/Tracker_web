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

import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.service.ChildService;
import com.wimk.service.ParentService;
import com.wimk.utils.ImageValidator;

@Controller
@RequestMapping(value = "/add_child")
public class AddChildController {

	private final String DIRECTORY_CHILD_AVATARS = File.separator + "resources" + File.separator + "core"
			+ File.separator + "images" + File.separator + "child_avatars";
	private final String DEFUALT_CHILD_AVATAR = DIRECTORY_CHILD_AVATARS + File.separator + "default.png";

	@Autowired
	ServletContext context;

	@Autowired
	ChildService childService;

	@Autowired
	ParentService parentService;

	@RequestMapping(method = RequestMethod.GET)
	public String viewAdditionChild(Map<String, Object> model) {
		Child child = new Child();
		model.put("userForm", child);
		return "AddChild";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String processAdditionChild(HttpServletRequest request, Map<String, Object> model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Parent parent = parentService.getByLogin(login);

		String childLogin = null;
		FileItem avatar = null;
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				@SuppressWarnings("unchecked")
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				for (FileItem item : multiparts) {
					if (!item.isFormField() && item.getFieldName().equals("avatar") && item.getSize() > 0) {
						if(!ImageValidator.isImage(item)){
							model.put("error", "Bad type of image.");
							return "AddChild";
						}
						avatar = item;
					} else if (item.getFieldName().equals("login")) {
						childLogin = item.getString();
					}
				}
			} catch (Exception ex) {
				request.setAttribute("message", "File Upload Failed due to " + ex);
			}
		}

		if (childLogin == null || childLogin.length() < 3 || childLogin.length() > 20) {
			model.put("error", "Child's name must be 3-20 letters");
			return "AddChild";
		}
		List<Child> children = childService.getChildOfParent(parent);
		for (Child c : children) {
			if (c.getLogin().equals(childLogin)) {
				model.put("error", "This child is already in WimK");
				return "AddChild";
			}
		}

		Child child = new Child();
		child.setLogin(childLogin);
		if (avatar != null) {
			try {
				File directory = new File(context.getRealPath("") + DIRECTORY_CHILD_AVATARS + File.separator + login);
				if (!directory.exists()) {
					directory.mkdirs();
				}
				String fileExtension = '.' + avatar.getName().split("\\.")[avatar.getName().split("\\.").length - 1];
				String filePath = DIRECTORY_CHILD_AVATARS + File.separator + login + File.separator + childLogin
						+ fileExtension;
				avatar.write(new File(context.getRealPath("") + filePath));
				child.setAvatar(filePath.replace(File.separatorChar, '/'));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			child.setAvatar(DEFUALT_CHILD_AVATAR.replace(File.separatorChar, '/'));
		}
		child.setParent(parent);
		child.setAuthorizatedNumber(0);
		childService.addChild(child);
		model.put("child", child);
		return "AddChildSuccess";
	}
	
}