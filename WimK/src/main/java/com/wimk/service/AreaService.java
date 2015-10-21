package com.wimk.service;

import java.util.List;

import com.wimk.entity.Area;

public interface AreaService {
	Area addArea(Area area);

	void delete(int id);

	Area editArea(Area area);

	List<Area> getAll();
}
