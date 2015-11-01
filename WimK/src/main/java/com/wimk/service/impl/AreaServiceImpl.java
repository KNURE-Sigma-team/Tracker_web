package com.wimk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wimk.entity.Area;
import com.wimk.entity.Child;
import com.wimk.repository.AreaRepository;
import com.wimk.service.AreaService;

@Service
public class AreaServiceImpl implements AreaService {
	@Autowired
	private AreaRepository areaRepository;
	
	@Transactional(readOnly = false)
	public Area addArea(Area area) {
		area.setId(-1);
		return areaRepository.saveAndFlush(area);
	}

	public void delete(int id) {
		areaRepository.delete(id);
	}

	public Area editArea(Area area) {
		return areaRepository.saveAndFlush(area);
	}

	public List<Area> getAll() {
		return areaRepository.findAll();
	}

	public List<Area> getAllAreasOfChild(Child child) {
		return areaRepository.findAreasByChild(child.getId());
	}

}
