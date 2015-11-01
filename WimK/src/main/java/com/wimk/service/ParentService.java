package com.wimk.service;

import java.util.List;

import com.wimk.entity.Parent;

public interface ParentService {
	Parent addParent(Parent parent);

	void delete(int id);

	Parent getByLogin(String login);
	
	Parent getById(Integer id);
	
	Parent editParent(Parent parent);

	List<Parent> getAll();
}
