package com.wimk.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.wimk.entity.Area;

@Transactional
public interface AreaRepository extends JpaRepository<Area, Integer> {

}
