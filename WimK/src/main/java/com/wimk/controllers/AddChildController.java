package com.wimk.controllers;

import java.util.Map;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.service.ChildService;
import com.wimk.service.ParentService;

@Controller
@RequestMapping(value = "/add_child")
public class AddChildController {
	@Autowired
	ChildService childService;
	
	@Autowired
	ParentService parentService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewAdditionChild(Map<String, Object> model) {
		Child child = new Child();
		model.put("userForm", child);
		return "AddChild";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String processAdditionChild(@ModelAttribute("userForm") Child child, Map<String, Object> model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String login = auth.getName();
		Parent parent = parentService.getByLogin(login);
		if (child.getLogin().length() < 6 || child.getLogin().length() > 20) {
			return "Child's name must be 6-20 letters";
		}
		List<Child> children = childService.getChildOfParent(parent);
		for (Child c : children) {
			if (c.getLogin().equals(child.getLogin())) {
				return "This child is already in WimK";
			}
		}
	    child.setParent(parent);
		childService.addChild(child);
		return "AddChildSuccess";
	}
}
