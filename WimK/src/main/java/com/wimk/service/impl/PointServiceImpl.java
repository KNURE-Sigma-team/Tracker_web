package com.wimk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wimk.entity.Child;
import com.wimk.entity.Point;
import com.wimk.repository.PointRepository;
import com.wimk.service.PointService;

@Service
public class PointServiceImpl implements PointService {
	@Autowired
	private PointRepository pointRepository;
	
	@Transactional(readOnly = false)
	public Point addPoint(Point point) {
		point.setId(-1);
		return pointRepository.saveAndFlush(point);
	}

	public void delete(int id) {
		pointRepository.delete(id);

	}

	public Point editParent(Point point) {
		return pointRepository.saveAndFlush(point);
	}

	public List<Point> getAll() {
		return pointRepository.findAll();
	}

	public List<Point> getAllPointsOfChild(Child child) {
		return pointRepository.findPointsByChild(child.getId());
	}

}
