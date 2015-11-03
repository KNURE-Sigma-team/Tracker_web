package com.wimk.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wimk.entity.PointType;
import com.wimk.repository.PointTypeRepository;
import com.wimk.service.PointTypeService;

@Service
public class PointTypeServiceImpl implements PointTypeService {
	
	@Autowired
	private PointTypeRepository pointTypeRepository;
	
	public PointType getByName(String name) {
		return pointTypeRepository.findByName(name);
	}

}
