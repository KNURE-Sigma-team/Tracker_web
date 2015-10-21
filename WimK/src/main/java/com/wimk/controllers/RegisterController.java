package com.wimk.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wimk.config.DataConfig;
import com.wimk.entity.Parent;
import com.wimk.service.ParentService;

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
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DataConfig.class);
		ParentService parentService = context.getBean(ParentService.class);
		parentService.addParent(user);
		context.close();
		return "RegistrationSuccess";
	}

}