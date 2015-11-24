package com.wimk.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.secure.Sha512Encoder;
import com.wimk.service.ChildService;
import com.wimk.service.ParentService;

@Controller
@RequestMapping(value = "/mobile_authorization")
public class MobileAuthorizationController {

	@Autowired
	ChildService childService;

	@Autowired
	ParentService parentService;

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody String mobileAuthorization(HttpServletRequest request, HttpServletResponse response) {
		String loginParent = request.getParameter("loginParent");
		String password = request.getParameter("password");
		if (loginParent != null || password != null) {
			Parent parent = parentService.getByLogin(loginParent);
			if (parent != null && parent.getPassword().equals(new Sha512Encoder().encode(password))) {
				List<Child> childList = childService.getChildOfParent(parent);
				return getStringChildList(childList);
			}
		}
		return "Exception";
	}

	private String getStringChildList(List<Child> childList) {
		StringBuilder sb = new StringBuilder();
		for (Child c : childList) {
			sb.append(c.getId()).append(';').append(c.getLogin()).append(';').append(c.getSendingFrequency())
					.append('\n');
		}
		return sb.toString();
	}
}
