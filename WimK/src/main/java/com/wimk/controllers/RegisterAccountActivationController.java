package com.wimk.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wimk.entity.Parent;
import com.wimk.service.ParentService;

@Controller
@RequestMapping(value = "/register/activation")
public class RegisterAccountActivationController {

	@Autowired
	ParentService parentService;

	@RequestMapping(method = RequestMethod.GET)
	public String viewRegistration(HttpServletRequest request, Map<String, Object> model) {
		String login = request.getParameter("login");
		String hash = request.getParameter("hash");
		if (login == null || hash == null) {
			model.put("message", "Activation account error");
		} else {
			Parent parent = parentService.getByLogin(login);
			if (parent == null || !parent.getHash().equals(hash)) {
				model.put("message", "Activation account error");
			} else {
				if (parent.getActivated()) {
					model.put("message", "This account has already activated");
				} else {
					parent.setActivated(true);
					parentService.editParent(parent);
					model.put("message", "Account was activate");
				}
			}
		}
		return "RegistrationSuccess";
	}

}
