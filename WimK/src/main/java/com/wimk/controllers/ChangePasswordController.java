package com.wimk.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wimk.service.ParentService;
import com.wimk.entity.Parent;
import com.wimk.secure.PasswordValidator;
import com.wimk.secure.Sha512Encoder;;

@Controller
@RequestMapping(value = "/change_password")
public class ChangePasswordController {

	@Autowired
	ParentService parentService;

	@RequestMapping(method = RequestMethod.GET)
	public String viewPasswordChange(Map<String, Object> model) {
		return "ChangePassword";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String viewPasswordChange(HttpServletRequest request, Map<String, Object> model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Parent parent = parentService.getByLogin(login);

		String oldPassword = request.getParameter("old_password");
		String newPassword = request.getParameter("new_password");
		String confirmPassword = request.getParameter("confirm_password");

		if (checkPasswords(parent, oldPassword, newPassword, confirmPassword)) {
			parent.setPassword(new Sha512Encoder().encode(newPassword));
			parentService.editParent(parent);
			model.put("answer", "Changing the password was successful");
		} else {
			model.put("answer", "Error. Password not changed.");
		}

		return "ChangePassword";
	}

	private boolean checkPasswords(Parent parent, String oldPassword, String newPassword, String confirmPassword) {
		if (oldPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()
				|| !parent.getPassword().equals(new Sha512Encoder().encode(oldPassword))
				|| !newPassword.equals(confirmPassword) || !new PasswordValidator().validate(newPassword)) {
			return false;
		}

		return true;
	}
}
