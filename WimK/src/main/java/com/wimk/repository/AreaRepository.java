package com.wimk.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wimk.entity.Area;

@Transactional
public interface AreaRepository extends JpaRepository<Area, Integer> {
	
	@Query(value = "SELECT * FROM Area WHERE idChild=:idChild", nativeQuery = true)
	List<Area> findAreasByChild(@Param("idChild") Integer idChild);
	
}
