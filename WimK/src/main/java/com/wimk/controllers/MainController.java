package com.wimk.controllers;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/")
public class MainController {
	@RequestMapping(method = RequestMethod.GET)
	public String viewMainForm(Map<String, Object> model) {
		return "Index";
	}
}
