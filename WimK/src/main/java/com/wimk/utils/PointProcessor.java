package com.wimk.utils;

import java.util.List;

import com.wimk.entity.Area;
import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.entity.Point;

public class PointProcessor {
	
	private static final String SOS_STRING = "sos";
	private static final String COMMON_STRING = "common";
	
	private PointProcessor() {
	}

	public static void pointProcess(Point point, Child child, Parent parent, List<Area> areaList) {
		if (point.getPointType().equals(SOS_STRING)) {
			EmailSender.sendSosMessage(child.getLogin(), parent.getLogin());
		} else if (point.getPointType().equals(COMMON_STRING)) {
			boolean allowedAreasPresent = false;
			boolean childInAllowedArea = false;
			for (Area area : areaList) {
				if (area.getAllowed()) {
					allowedAreasPresent = true;
					if (pointIntoArea(point, area)) {
						childInAllowedArea = true;
					}
				} else if (pointIntoArea(point, area)) {
					EmailSender.sendMessageChildIntoForbiddenArea(child.getLogin(), point.getTime(), parent.getLogin());
					return;
				}
			}
			
			if (allowedAreasPresent && !childInAllowedArea) {
				EmailSender.sendMessageChildLeaveAllowedArea(child.getLogin(), point.getTime(), parent.getLogin());
			}
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
		double c = 2.0 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		double distance = c * radius;
		if (distance < area.getRadius()) {
			return true;
		}
		return false;
	}
}
