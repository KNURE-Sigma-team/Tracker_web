package com.wimk.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wimk.entity.Point;

@Transactional
public interface PointRepository extends JpaRepository<Point, Integer> {
	
	@Query(value = "SELECT * FROM Point WHERE idChild=:idChild", nativeQuery = true)
	List<Point> findPointsByChild(@Param("idChild") Integer idChild);
	
	@Modifying
	@Query(value = "Delete From Point WHERE idPoint IN (SELECT * FROM (Select Point.idPoint From Point, Child, Parent WHERE Parent.idParent = Child.idParent AND Child.idChild = Point.idChild AND  Parent.removingFrequency < TIMESTAMPDIFF(DAY,  Point.time, CURTIME())) as TEMPLATE_POINT)", nativeQuery = true)
	void clearingPoints();
}
