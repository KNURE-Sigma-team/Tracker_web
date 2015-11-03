package com.wimk.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wimk.entity.Point;
import com.wimk.entity.PointType;

@Transactional
public interface PointTypeRepository extends JpaRepository<Point, Integer>{
	
	@Query("select b from PointType b where b.name=:name")
	PointType findByName(@Param("name") String name);
	
}
