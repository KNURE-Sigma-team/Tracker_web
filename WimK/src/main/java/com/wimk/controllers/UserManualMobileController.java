package com.wimk.controllers;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/mobile_user_manual")
public class UserManualMobileController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewAdditionChild(Map<String, Object> model) {
		return "MobileManual";
	}
	
}
