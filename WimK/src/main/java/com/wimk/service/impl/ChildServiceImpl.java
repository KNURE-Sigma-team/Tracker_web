package com.wimk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.repository.ChildRepository;
import com.wimk.service.ChildService;

@Service
public class ChildServiceImpl implements ChildService {
	@Autowired
	private ChildRepository childRepository;

	@Transactional(readOnly = false)
	public Child addChild(Child child) {
		child.setId(-1);
		return childRepository.saveAndFlush(child);
	}

	public void delete(int id) {
		childRepository.delete(id);
	}

	public Child editChild(Child child) {
		return childRepository.saveAndFlush(child);
	}

	public List<Child> getAll() {
		return childRepository.findAll();
	}

	public List<Child> getChildOfParent(Parent parent) {
		return childRepository.findChildOfParent(parent.getIdParent());
	}

	public Child getById(Integer id) {
		return childRepository.findById(id);
	}

	@Override
	@Transactional(readOnly = false)
	public List<Child> getUnconnectedChild() {
		List<Child> temp = childRepository.getUnconnectedChilds();
		childRepository.checkUnconnectedChilds();
		return temp;
	}

}
