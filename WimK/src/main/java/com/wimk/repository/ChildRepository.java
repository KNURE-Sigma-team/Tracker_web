package com.wimk.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wimk.entity.Child;

@Transactional
public interface ChildRepository extends JpaRepository<Child, Integer> {
	
	@Query(value = "SELECT * FROM Child WHERE idParent=:idParent", nativeQuery = true)
	List<Child> findChildOfParent(@Param("idParent") Integer idParent);
	
	@Query("select c from Child c where c.id=:idChild")
	Child findById(@Param("idChild") Integer idChild);
}