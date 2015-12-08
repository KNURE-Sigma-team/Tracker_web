package com.wimk.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
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
	
	@Query(value = "Select Child.* FROM Child, Point WHERE Child.idChild = Point.idChild AND Child.sendingFrequency + 5 < TIMESTAMPDIFF(MINUTE, (Select MAX(p1.time) From Point p1 Where p1.idChild = Child.idChild), CURTIME()) AND Child.authorizatedNumber > 0 AND NOT Child.checked;", nativeQuery = true)
	List<Child> getUnconnectedChilds();
	
	@Modifying
	@Query(value = "Update Child Set checked = 1 Where idChild IN (Select * FROM (Select Child.idChild FROM Child, Point WHERE Child.idChild = Point.idChild AND Child.sendingFrequency + 5 < TIMESTAMPDIFF(MINUTE, (Select MAX(p1.time) From Point p1 Where p1.idChild = Child.idChild), CURTIME()) AND Child.authorizatedNumber > 0 AND NOT Child.checked) as Temp)", nativeQuery = true)
	void checkUnconnectedChilds();
}