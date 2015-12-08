package com.wimk.controllers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wimk.entity.Area;
import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.entity.Point;
import com.wimk.service.AreaService;
import com.wimk.service.ChildService;
import com.wimk.service.ParentService;
import com.wimk.service.PointService;
import com.wimk.service.PointTypeService;
import com.wimk.utils.PointProcessor;

@Controller
@RequestMapping(value = "/mobile_get_point")
public class MobileGetPointController {

	@Autowired
	ParentService parentService;

	@Autowired
	PointService pointService;

	@Autowired
	ChildService childService;

	@Autowired
	AreaService areaService;

	@Autowired
	PointTypeService pointTypeService;

	/*
	 * Method get request and response. Request must contain new parameters:
	 * "idChild", "longitude", "latitude", "battery_level", "time". Based on
	 * this data method put new point in the database. Return "OK" if method
	 * success end else "Invalid input data"
	 */

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody String getPoint(HttpServletRequest request, HttpServletResponse response) {
		String parentLogin = request.getParameter("parent_login");
		String childLogin = request.getParameter("child_login");
		List<Child> listOfChild = childService.getChildOfParent(parentService.getByLogin(parentLogin));
		Child child = null;
		for (Child c : listOfChild) {
			if (c.getLogin().equals(childLogin)) {
				child = c;
				break;
			}
		}

		Double latitude = Double.parseDouble(request.getParameter("latitude"));
		Double longitude = Double.parseDouble(request.getParameter("longitude"));
		Integer battery_level = Integer.parseInt(request.getParameter("battery_level"));
		String pointType = request.getParameter("point_type");

		String timeString = request.getParameter("time");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
		Date time;
		try {
			time = format.parse(timeString);
		} catch (ParseException e) {
			return "Invalid input data";
		}

		if (child != null && longitude != null && latitude != null && battery_level != null && time != null
				&& pointType != null) {
			Point point = new Point(child, latitude, longitude, time, battery_level,
					pointTypeService.getByName(pointType));
			pointService.addPoint(point);
			
			child.setChecked(false);
			childService.editChild(child);
			
			List<Area> areaList = areaService.getAllAreasOfChild(child);
			Parent parent = child.getParent();
			PointProcessor.pointProcess(point, child, parent, areaList, request);
			return "OK";
		}
		return "Exception";
	}

}
