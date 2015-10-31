package com.wimk.controllers;

import java.util.Map;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wimk.entity.Parent;
import com.wimk.secure.PasswordValidator;
import com.wimk.service.ParentService;

@Controller
@RequestMapping(value = "/register")
public class RegisterController {
	
	@Autowired
	ParentService parentService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewRegistration(Map<String, Object> model) {
		Parent userForm = new Parent();
		model.put("userForm", userForm);
		return "Registration";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String processRegistration(@ModelAttribute("userForm") Parent user,
	Map<String, Object> model) {
		boolean valid = EmailValidator.getInstance().isValid(user.getLogin());
		if (!valid) {
			return "Email is invalid";
		}
		if (parentService.getByLogin(user.getLogin()) != null) {
			return "This login is already used";
		}

		if (user.getName().length() > 16) {
			return "Name is too long";
		}
		if (user.getPassword().length() < 8 || !new PasswordValidator().validate(user.getPassword())) {
			return "Password is too simple";
		}
		parentService.addParent(user);
		return "RegistrationSuccess";
	}

}