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
@RequestMapping(value = "/edit_profile")
public class EditProfileController {
	
	@Autowired
	ParentService parentService;
	
	/*
	 * Get child of current parent and put him into the model of EditChild.jsp
	 */
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewEditChild(Map<String, Object> model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Parent parent = parentService.getByLogin(login);
		model.put("parent", parent);
		return "EditProfile";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String editChild(HttpServletRequest request, Map<String, Object> model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String authLogin = auth.getName();
		Parent parent = parentService.getByLogin(authLogin);
		
		String login = request.getParameter("login");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Integer removingFrequency = Integer.parseInt(request.getParameter("removing_frequency"));
		
		parent.setLogin(login);
		parent.setName(name);
		parent.setRemovingFrequency(removingFrequency);
		if(!new Sha512Encoder().matches(password, parent.getPassword())){
			model.put("parent", parent);
			model.put("invalid_password", "Invalid password");
			return "EditProfile";
		}
		if(!authLogin.equals(login) &&
			parentService.getByLogin(login) != null){
			model.put("parent", parent);
			model.put("parent_exist", "Someone already has that username. Try another?");
			return "EditProfile";
		}
		parentService.editParent(parent);
		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(parent.getLogin(), password);
		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:personal_cabinet";
	}
}
