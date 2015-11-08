package com.wimk.controllers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wimk.entity.Area;
import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.entity.Point;
import com.wimk.service.AreaService;
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

	@Autowired
	AreaService areaService;

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
		List<Area> listOfAreas = new ArrayList<Area>();
		if (currentChild != null) {
			listOfPoints = pointService.getAllPointsOfChild(currentChild);
			listOfAreas = areaService.getAllAreasOfChild(currentChild);
		}

		// Work with date
		List<String> listOfDates = new ArrayList<String>();
		String dateString = "This child doesn't have points";

		if (listOfPoints.size() > 0) {
			StringBuilder sb = new StringBuilder();
			for (Point p : listOfPoints) {
				sb.append(p.getTime().getYear() + 1900).append('-').append(p.getTime().getMonth() + 1).append('-')
						.append(p.getTime().getDate());
				if (!listOfDates.contains(sb.toString())) {
					listOfDates.add(sb.toString());
				}
				sb.setLength(0);
			}

			dateString = request.getParameter("date");
			if (dateString == null) {
				dateString = listOfDates.get(listOfDates.size() - 1);
			}

			DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
			Date date;
			try {
				date = format.parse(dateString);
			} catch (ParseException e) {
				return "Invalid input data";
			}

			for (int i = 0; i < listOfPoints.size(); ++i) {
				Date temp = listOfPoints.get(i).getTime();
				if (date.compareTo(temp)!=0) {
					listOfPoints.remove(i--);
				}
			}
		}
		
		listOfDates.sort(new Comparator<String>(){
			public int compare(String o1, String o2) {
				return o1.compareTo(o2);
			}
		});
		listOfPoints.sort(new Comparator<Point>() {
			public int compare(Point o1, Point o2) {
				return o1.getTime().compareTo(o2.getTime());
			}
		});
		
		model.put("listOfChild", listOfChild);
		model.put("currentChild", currentChild);
		model.put("listOfPoints", listOfPoints);
		model.put("listOfAreas", listOfAreas);
		model.put("listOfDates", listOfDates);
		model.put("currentDate", dateString);

		return "ViewPoints";
	}

}
