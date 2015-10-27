package com.wimk.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.entity.Point;
import com.wimk.service.ChildService;
import com.wimk.service.ParentService;
import com.wimk.service.PointService;

@Controller
@RequestMapping(value = "/view_points")
public class ViewPointsController {
	@Autowired
	ChildService childService;

	@Autowired
	ParentService parentService;

	@Autowired
	PointService pointService;

	/*
	 * Method get request and model. return name of view. Method process input
	 * data from request and put in model: 1) list of parents child; 2) current
	 * child. If parameter in request "currentChild" == null then currentChild
	 * will be first child in list else currentChild. 3) list of points current
	 * child.
	 */

	@RequestMapping(method = RequestMethod.GET)
	public String viewShowPoints(HttpServletRequest request, Map<String, Object> model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Parent parent = parentService.getByLogin(login);
		List<Child> listOfChild = childService.getChildOfParent(parent);

		Child currentChild = null;
		if (request.getParameter("currentChild") != null) {
			for (Child c : listOfChild) {
				if (c.getLogin().equals(request.getParameter("currentChild").toString())) {
					currentChild = c;
					break;
				}
			}
		} else if (listOfChild.size() > 0) {
			currentChild = listOfChild.get(0);
		}

		List<Point> listOfPoints = new ArrayList<Point>();
		if (currentChild != null) {
			listOfPoints = pointService.getAllPointsOfChild(currentChild);
		}

		model.put("listOfChild", listOfChild);
		model.put("currentChild", currentChild);
		model.put("listOfPoints", listOfPoints);

		return "ViewPoints";
	}

}
