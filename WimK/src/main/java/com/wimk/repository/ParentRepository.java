package com.wimk.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.wimk.entity.Parent;

@Transactional
public interface ParentRepository extends JpaRepository<Parent, Integer> {

	@Query("select b from Parent b where b.login=:login")
	Parent findByLogin(@Param("login") String login);
	
	@Query("select b from Parent b where b.id=:id")
	Parent findById(@Param("id") Integer id);
}
