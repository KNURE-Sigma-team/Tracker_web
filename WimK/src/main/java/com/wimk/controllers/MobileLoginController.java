package com.wimk.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wimk.entity.Child;
import com.wimk.service.ChildService;
import com.wimk.service.ParentService;

@Controller
@RequestMapping(value = "/mobile_login")
public class MobileLoginController {
	
	@Autowired
	ChildService childService;
	
	@Autowired
	ParentService parentService;

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody String doPost(HttpServletRequest request, HttpServletResponse response) {
		String result = "Exception";
		String parentLogin = request.getParameter("parent_login");
		String childLogin = request.getParameter("child_login");
		List<Child> listOfChild = childService.getChildOfParent(parentService.getByLogin(parentLogin));
		Child child = null;
		for (Child c : listOfChild) {
			if (c.getLogin().equals(childLogin)) {
				child = c;
				break;
			}
		}
		if (child != null) {
			child.setAuthorizatedNumber(child.getAuthorizatedNumber() + 1);
			child.setGoogleToken(null);
			childService.editChild(child);
			result = "OK";
		}
		return result;
	}
}