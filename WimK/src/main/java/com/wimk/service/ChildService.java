package com.wimk.service;

import java.util.List;

import com.wimk.entity.Child;

public interface ChildService {
	Child addChild(Child child);

	void delete(int id);

	Child editParent(Child child);

	List<Child> getAll();
}
