package com.wimk.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	public String processRegistration(HttpServletRequest request, @ModelAttribute("userForm") Parent user,
	Map<String, Object> model) {
		boolean valid = EmailValidator.getInstance().isValid(user.getLogin());
		if (!valid) {
			request.setAttribute("error_message", "Email is invalid");
			return "Registration";
		}
		if (parentService.getByLogin(user.getLogin()) != null) {
			request.setAttribute("error_message", "This login is already used");
			return "Registration";
		}

		if (user.getName().length() > 16) {
			request.setAttribute("error_message", "Name is too long");
			return "Registration";
		}
		if (user.getPassword().length() < 8 || !new PasswordValidator().validate(user.getPassword())) {
			request.setAttribute("error_message", "Password is too simple");
			return "Registration";
		}
		parentService.addParent(user);
		return "RegistrationSuccess";
	}

}