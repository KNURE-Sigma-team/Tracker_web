package com.wimk.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wimk.entity.Parent;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	@RequestMapping(method = RequestMethod.GET)
	public String viewLogin(HttpServletRequest request, Map<String, Object> model) {
		if (request.getParameter("error") != null) {
			request.setAttribute("error_message", "There is no such user or password is wrong");
		}
		if (request.getParameter("restore_password_successful") != null) {
			request.setAttribute("restore_password_message", "You have changed successfully password");
		}
		model.put("user", new Parent());
		return "Login";
	}
}