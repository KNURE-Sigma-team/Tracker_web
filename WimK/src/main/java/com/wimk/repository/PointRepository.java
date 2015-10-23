package com.wimk.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wimk.entity.Point;

@Transactional
public interface PointRepository extends JpaRepository<Point, Integer> {
	
	@Query(value = "SELECT * FROM Point WHERE idChild=:idChild", nativeQuery = true)
	List<Point> findPointsByChild(@Param("idChild") Integer idChild);
	
}
