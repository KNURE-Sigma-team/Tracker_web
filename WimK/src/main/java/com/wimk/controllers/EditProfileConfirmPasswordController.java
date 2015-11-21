package com.wimk.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wimk.entity.Parent;
import com.wimk.secure.Sha512Encoder;
import com.wimk.service.ParentService;

@Controller
@RequestMapping(value = "/edit_profile_confirm_password")
public class EditProfileConfirmPasswordController {
	
	@Autowired
	ParentService parentService;
	
	/*
	 * Get child of current parent and put him into the model of EditChild.jsp
	 */
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewEditChild(Map<String, Object> model) {
		return "EditProfileConfirmPassword";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String editChild(HttpServletRequest request, Map<String, Object> model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String authLogin = auth.getName();
		Parent parent = parentService.getByLogin(authLogin);
		
		String password = request.getParameter("password");
		Parent newParent = (Parent) request.getSession().getAttribute("parent");
		
		parent.setLogin(newParent.getLogin());
		parent.setName(newParent.getName());
		parent.setRemovingFrequency(newParent.getRemovingFrequency());
		if(!new Sha512Encoder().matches(password, parent.getPassword())){
			model.put("parent", parent);
			model.put("invalid_password", "Invalid password");
			return "EditProfileConfirmPassword";
		}
		
		parentService.editParent(parent);
		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(parent.getLogin(), password);
		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:personal_cabinet";
	}
}
