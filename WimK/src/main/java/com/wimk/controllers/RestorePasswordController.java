package com.wimk.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wimk.entity.Parent;
import com.wimk.secure.Sha512Encoder;
import com.wimk.service.ParentService;
import com.wimk.utils.EmailSender;

@Controller
@RequestMapping(value = "/restore_password")
public class RestorePasswordController {

	@Autowired
	ParentService parentService;

	@RequestMapping(method = RequestMethod.GET)
	public String restorePassword(HttpServletRequest request, Map<String, Object> model) {
		String login = request.getParameter("email");
		if (login == null) {
			return "RestorePassword";
		}
		Parent parent = parentService.getByLogin(login);
		if(parent == null){
			model.put("email_not_exist", "No account found with that email address.");
			return "RestorePassword";
		}
		
		String newPassword = RandomStringUtils.randomAlphanumeric(10);
		parent.setPassword(new Sha512Encoder().encode(newPassword));
		parentService.editParent(parent);
		
		EmailSender.sendRestorePasswordMessage(parent.getLogin(), newPassword);
		
		return "Login";
	}

}
