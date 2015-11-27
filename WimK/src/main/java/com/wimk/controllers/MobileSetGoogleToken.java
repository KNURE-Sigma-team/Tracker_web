package com.wimk.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wimk.entity.Child;
import com.wimk.service.ChildService;

@Controller
@RequestMapping(value = "/mobile_set_child_token")
public class MobileSetGoogleToken {

	@Autowired
	ChildService childService;

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody String doPost(HttpServletRequest request, HttpServletResponse response) {
		String result = "Exception";
		Integer idChild = Integer.parseInt(request.getParameter("id_child"));
		String token = request.getParameter("token");
		if (idChild != null && token != null) {
			Child child = childService.getById(idChild);
			child.setAuthorizatedNumber(child.getAuthorizatedNumber() + 1);
			child.setGoogleToken(token);
			childService.editChild(child);
			result = "OK";
		}
		return result;
	}

}