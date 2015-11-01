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
import com.wimk.entity.Parent;
import com.wimk.service.ChildService;
import com.wimk.service.ParentService;

@Controller
@RequestMapping(value = "/mobile_authorization")
public class MobileAuthorizationController {

	@Autowired
	ChildService childService;

	@Autowired
	ParentService parentService;

	/*
	 * Method get request and response. Request must contain next parameters:
	 * "loginParent","loginChild","password". Method return id of child if input
	 * data is correct, else will be write -1.
	 */
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody String mobileAuthorization(HttpServletRequest request, HttpServletResponse response) {
		String loginParent = (String) request.getParameter("loginParent");
		String loginChild = (String) request.getParameter("loginChild");
		String password = (String) request.getParameter("password");

		if (loginParent != null || loginChild != null || password != null) {
			Parent parent = parentService.getByLogin(loginParent);
			if (parent != null && parent.getPassword().equals(password)) {
				List<Child> childList = childService.getChildOfParent(parent);
				for (Child c : childList) {
					if (c.getLogin().equals(loginChild)) {
						return c.getId().toString();
					}
				}
			}
		}
		return Integer.valueOf(-1).toString();
	}
}
