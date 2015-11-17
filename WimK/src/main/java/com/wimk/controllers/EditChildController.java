package com.wimk.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

@Controller
@RequestMapping(value = "/edit_child")
public class EditChildController {

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

	@RequestMapping(method = RequestMethod.POST)
	public String childEditor(HttpServletRequest request, Map<String, Object> model) {
		String address = "redirect:personal_cabinet";
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Parent parent = parentService.getByLogin(login);
		List<Child> listOfChild = childService.getChildOfParent(parent);
		
		switch (request.getParameter("status")) {
			case "edit":
				editChild(request, listOfChild, model, address);
				break;
			case "remove":
				removeChild(request, listOfChild);
				break;
		}
		return address;
	}
	
	private void editChild(HttpServletRequest request, List<Child> listOfChild, Map<String, Object> model, String address){
		String childLogin = request.getParameter("child_login");
		String oldChildLogin = request.getParameter("old_child_login");
		Integer sendingFrequency = Integer.parseInt(request.getParameter("sending_frequency"));
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
		child.setSendingFrequency(sendingFrequency);
		if (oldChildLogin.equals(childLogin) || !childExist) {
			child.setLogin(childLogin);
			childService.editChild(child);
		} else {
			model.put("child", child);
			model.put("child_exist", "You can't have second child with same name");
			address =  "EditChild";
		}
	}
	
	private void removeChild(HttpServletRequest request, List<Child> listOfChild){
		String childLogin = request.getParameter("child_login");
		Child child = null;
		for (Child c : listOfChild) {
			if (c.getLogin().equals(childLogin)) {
				child = c;
				break;
			}
		}
		if(child == null){
			throw new RuntimeException();
		}
		childService.delete(child.getId());
	}
}