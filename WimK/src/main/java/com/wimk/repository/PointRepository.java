package com.wimk.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.wimk.entity.Point;

@Transactional
public interface PointRepository extends JpaRepository<Point, Integer> {

}
