package com.wimk.service;

import java.util.List;

import com.wimk.entity.Child;
import com.wimk.entity.Parent;

public interface ChildService {
	Child addChild(Child child);

	void delete(int id);
	
	Child getByLogin(String login);

	Child editParent(Child child);

	List<Child> getAll();
	
	List<Child> getChildOfParent(Parent parent);
	
	Child getById(Integer id);
}
