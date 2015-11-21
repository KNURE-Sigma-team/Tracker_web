package com.wimk.service;

import java.util.List;

import com.wimk.entity.Child;
import com.wimk.entity.Point;

public interface PointService {
	Point addPoint(Point point);

	void delete(int id);

	Point editPoint(Point point);

	List<Point> getAll();
	
	List<Point> getAllPointsOfChild(Child child);
}
