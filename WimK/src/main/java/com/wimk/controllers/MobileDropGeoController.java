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
import com.wimk.service.ChildService;
import com.wimk.service.ParentService;
import com.wimk.utils.EmailSender;

@Controller
@RequestMapping(value = "/mobile_drop_geo")
public class MobileDropGeoController {

	@Autowired
	ChildService childService;

	@Autowired
	ParentService parentService;

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody String doPost(HttpServletRequest request, HttpServletResponse response) {
		String result = "Exception";
		String parentLogin = request.getParameter("parent_login");
		String childLogin = request.getParameter("child_login");
		List<Child> listOfChild = childService.getChildOfParent(parentService.getByLogin(parentLogin));
		for (Child c : listOfChild) {
			if (c.getLogin().equals(childLogin)) {
				EmailSender.sendGeoDropEmail(parentLogin, childLogin, getAccountActivatedAddress(request));
				result = "OK";
				break;
			}
		}
		return result;
	}

	private static String getAccountActivatedAddress(HttpServletRequest request) {
		StringBuilder sb = new StringBuilder();
		sb.append(request.getScheme()).append("://").append(request.getServerName()).append(':')
				.append(request.getServerPort()).append(request.getRequestURI());
		String url = sb.toString();
		return url.substring(0, url.indexOf('/', url.indexOf("/mobile_drop_geo")));
	}
}
