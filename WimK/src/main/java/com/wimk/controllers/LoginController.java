package com.wimk.controllers;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wimk.entity.Parent;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	@RequestMapping(method = RequestMethod.GET)
	public String viewLogin(Map<String, Object> model) {
		model.put("user", new Parent());
		return "Login";
	}
}
