package com.wimk.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.wimk.entity.Child;

@Transactional
public interface ChildRepository extends JpaRepository<Child, Integer> {

}