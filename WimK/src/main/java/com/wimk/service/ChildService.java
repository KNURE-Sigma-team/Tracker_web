package com.wimk.service;

import java.util.List;

import com.wimk.entity.Child;
import com.wimk.entity.Parent;

public interface ChildService {
	Child addChild(Child child);

	void delete(int id);

	Child editChild(Child child);

	List<Child> getAll();
	
	List<Child> getChildOfParent(Parent parent);
	
	List<Child> getUnconnectedChild();
	
	Child getById(Integer id);
}
