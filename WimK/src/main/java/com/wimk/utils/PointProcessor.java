package com.wimk.utils;

import java.util.List;

import com.wimk.entity.Area;
import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.entity.Point;

public class PointProcessor {

	private PointProcessor() {
	}

	public static void pointProcess(Point point, Child child, Parent parent, List<Area> areaList) {
		if (point.getPointType().equals("sos")) {
			EmailSender.sendSosMessage(child.getLogin(), parent.getLogin());
		} else if (point.getPointType().equals("common")) {
			boolean allowedAreasPresent = false;
			boolean childInAllowedArea = false;
			for (Area area : areaList) {
				if(area.getAllowed()){
					allowedAreasPresent = true;
					if(pointIntoArea(point, area)){
						childInAllowedArea = true;
					}
				} else if (pointIntoArea(point, area)){
					EmailSender.sendMessageChildIntoForbiddenArea(child.getLogin(), point.getTime(), parent.getLogin());
					return;
				}
			}
			
			if(allowedAreasPresent && !childInAllowedArea){
				EmailSender.sendMessageChildLeaveAllowedArea(child.getLogin(), point.getTime(), parent.getLogin());
			}
		}
	}

	private static boolean pointIntoArea(Point point, Area area) {
		if (Math.sqrt(Math.pow(point.getX() - area.getX(), 2) + Math.pow(point.getY() - area.getY(), 2)) < area
				.getRadius()) {
			return true;
		}
		return false;
	}
}
