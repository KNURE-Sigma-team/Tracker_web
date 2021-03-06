package com.wimk.utils;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wimk.entity.Area;
import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.entity.Point;

public class PointProcessor {

	private static final String SOS_STRING = "sos";
	private static final String COMMON_STRING = "common";
	private static final String ON_DEMAND_STRING = "on_demand";
	private static final String STORAGED = "storaged";

	private PointProcessor() {
	}

	public static void pointProcess(Point point, Child child, Parent parent, List<Area> areaList,
			HttpServletRequest request) {
		switch(point.getPointType().getName()){
				case SOS_STRING:
					EmailSender.sendSosMessage(child.getLogin(), parent.getLogin(), point, getAccountActivatedAddress(request));
					break;
				case ON_DEMAND_STRING:
				case STORAGED:
				case COMMON_STRING:
					boolean allowedAreasPresent = false;
					boolean childInAllowedArea = false;
					for (Area area : areaList) {
						if (area.getAllowed()) {
						allowedAreasPresent = true;
						if (pointIntoArea(point, area)) {
							childInAllowedArea = true;
						}
						} else if (pointIntoArea(point, area)) {
						EmailSender.sendMessageChildIntoForbiddenArea(child.getLogin(), parent.getLogin(), point, area,
							getAccountActivatedAddress(request));
						return;
						}
					}	
					if (allowedAreasPresent && !childInAllowedArea) {
						EmailSender.sendMessageChildLeaveAllowedArea(child.getLogin(), parent.getLogin(), point,
							getAccountActivatedAddress(request));
					}	
					break;
		}
	}

	private static boolean pointIntoArea(Point point, Area area) {
		double radius = 6371000;
		double fi1 = Math.toRadians(point.getX());
		double fi2 = Math.toRadians(area.getX());
		double deltaFi = Math.toRadians(point.getX() - area.getX());
		double deltaLambda = Math.toRadians(point.getY() - area.getY());

		double a = Math.sin(deltaFi / 2.0) * Math.sin(deltaFi / 2.0)
				+ Math.cos(fi1) * Math.cos(fi2) * Math.sin(deltaLambda / 2.0) * Math.sin(deltaLambda / 2.0);
		double c = 2.0 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		double distance = c * radius;
		if (distance < area.getRadius()) {
			return true;
		}
		return false;
	}

	private static String getAccountActivatedAddress(HttpServletRequest request) {
		StringBuilder sb = new StringBuilder();
		sb.append(request.getScheme()).append("://").append(request.getServerName()).append(':')
				.append(request.getServerPort()).append(request.getRequestURI());
		String url = sb.toString();
		return url.substring(0, url.indexOf('/', url.indexOf("/mobile_get_point")));
	}
}
