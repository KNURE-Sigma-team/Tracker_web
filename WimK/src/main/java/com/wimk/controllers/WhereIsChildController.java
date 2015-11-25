package com.wimk.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.service.ChildService;
import com.wimk.service.ParentService;
import com.wimk.utils.PushNotificationSender;

@Controller
@RequestMapping(value = "/where_is_child")
public class WhereIsChildController {

	@Autowired
	ChildService childService;
	
	@Autowired
	ParentService parentService;
	
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody String doPost(HttpServletRequest request, HttpServletResponse response) {
		String result = "Exception";

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Parent parent = parentService.getByLogin(login);
		List<Child> listOfChild = childService.getChildOfParent(parent);
		Child child = null;
		for (Child c : listOfChild) {
			if (c.getLogin().equals(request.getParameter("child").toString())) {
				child = c;
			}
		}
		
		if(child != null && child.getGoogleToken() != null){
			try {
				PushNotificationSender.sendPush(child.getGoogleToken());
				result = "OK";
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
}
