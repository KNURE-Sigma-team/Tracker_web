package com.wimk.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wimk.entity.Parent;
import com.wimk.service.ParentService;
import com.wimk.utils.EmailSender;

@Controller
@RequestMapping(value = "/restore_password")
public class RestorePasswordController {

	@Autowired
	ParentService parentService;

	@RequestMapping(method = RequestMethod.GET)
	public String restorePassword(HttpServletRequest request) {
		String login = request.getParameter("email");
		if (login == null) {
			return "RestorePassword";
		}
		Parent parent = parentService.getByLogin(login);
		if(parent != null){
			EmailSender.sendRestorePasswordMessage(parent.getLogin(), parent.getPassword());
		}
		return "Login";
	}

}
