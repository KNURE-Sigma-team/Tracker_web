package com.wimk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wimk.entity.Parent;
import com.wimk.repository.ParentRepository;
import com.wimk.secure.Sha512Encoder;
import com.wimk.service.ParentService;

@Service
public class ParentServiceImpl implements ParentService {

	@Autowired
	private ParentRepository parentRepository;

	@Transactional(readOnly = false)
	public Parent addParent(Parent parent) {
		parent.setRemovingFrequency(10);
		parent.setPassword(new Sha512Encoder().encode(parent.getPassword()));
		return parentRepository.saveAndFlush(parent);
	}

	public void delete(int id) {
		parentRepository.delete(id);
	}

	public Parent getByLogin(String login) {
		return parentRepository.findByLogin(login);
	}

	public Parent editParent(Parent parent) {
		return parentRepository.saveAndFlush(parent);
	}

	public List<Parent> getAll() {
		return parentRepository.findAll();
	}

	public Parent getById(Integer id) {
		return parentRepository.findById(id);
	}

}
