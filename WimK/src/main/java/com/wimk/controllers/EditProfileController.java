package com.wimk.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wimk.entity.Parent;
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
		
		String name = request.getParameter("name");
		Integer removingFrequency = Integer.parseInt(request.getParameter("removing_frequency"));
		
		parent.setName(name);
		parent.setRemovingFrequency(removingFrequency);
		if(removingFrequency < 5 || removingFrequency > 90){
			model.put("parent", parent);
			model.put("invalid_removing_frequency", "Invalid removing frequency");
			return "EditProfile";
		}

		parentService.editParent(parent);
		return "redirect:personal_cabinet";
	}
}
