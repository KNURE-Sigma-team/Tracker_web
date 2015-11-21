package com.wimk.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/restore_password_confirming")
public class RestorePasswordConfirmingCodeController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewRestorePasswordConfirmingCode(HttpServletRequest request, Map<String, Object> model) {
		if(request.getSession().getAttribute("confirmingCode") == null){
			return "Login";
		}
		return "RestorePassword/RestorePasswordConfirmingCode";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String checkConfirmingCode(HttpServletRequest request, Map<String, Object> model) {
		String confirmingCode = request.getParameter("code");
		if(!confirmingCode.equals(request.getSession().getAttribute("confirmingCode"))){
			return "RestorePassword/RestorePasswordConfirmingCode";
		}
		request.getSession().removeAttribute("confirmingCode");
		request.getSession().setAttribute("confirmedCode", Boolean.valueOf(true));
		return "redirect:restore_password_change_password";
	}
}
