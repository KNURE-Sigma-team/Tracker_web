package com.wimk.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wimk.domain.Parent;

@Controller
@RequestMapping(value = "/register")
public class RegisterController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewRegistration(Map<String, Object> model) {
		Parent userForm = new Parent();
		model.put("userForm", userForm);

		List<String> professionList = new ArrayList<String>();
		professionList.add("Developer");
		professionList.add("Designer");
		professionList.add("IT Manager");
		model.put("professionList", professionList);

		return "Registration";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String processRegistration(@ModelAttribute("userForm") Parent user,
	Map<String, Object> model) {
		System.out.println("username: " + user.getLogin());
		System.out.println("password: " + user.getPassword());
		System.out.println("email: " + user.getName());
		return "RegistrationSuccess";
	}

}