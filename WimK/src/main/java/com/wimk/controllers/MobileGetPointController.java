package com.wimk.controllers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wimk.entity.Child;
import com.wimk.entity.Point;
import com.wimk.service.ChildService;
import com.wimk.service.PointService;

@Controller
@RequestMapping(value = "/mobile_get_point")
public class MobileGetPointController {

	@Autowired
	PointService pointService;

	@Autowired
	ChildService childService;

	/*
	 * Method get request and response. Request must contain new parameters:
	 * "idChild", "longitude", "latitude", "battery_level", "time". Based on
	 * this data method put new point in the database.
	 */

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody String getPoint(HttpServletRequest request, HttpServletResponse response) {
		Integer idChild = Integer.parseInt(request.getParameter("idChild"));
		Double longitude = Double.parseDouble(request.getParameter("longitude"));
		Double latitude = Double.parseDouble(request.getParameter("latitude"));
		Integer battery_level = Integer.parseInt(request.getParameter("battery_level"));
		
		String timeString = request.getParameter("time");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
		Date time;
		try {
			time = format.parse(timeString);
		} catch (ParseException e) {
			return null;
		}

		if (idChild != null || longitude != null || latitude != null || battery_level != null || time != null) {
			Child child = childService.getById(idChild);
			if (child != null) {
				Point point = new Point();
				point.setChild(child);
				point.setX(latitude);
				point.setY(longitude);
				point.setBatteryStatus(battery_level);
				point.setTime(time);
				pointService.addPoint(point);
			}
		}
		return null;
	}

}