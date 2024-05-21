package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Enterprise;
import com.green.jobhunter.entity.Member;

@Repository
public interface EnterpriseRepository extends JpaRepository<Enterprise, Long> {
	//Enterprise findByEid_Memberid(String eid);
	
	@Query(value = "SELECT * FROM enterprise WHERE eid = :eid", nativeQuery = true)
	Enterprise findByEid(@Param("eid") String id);
	
	Enterprise findByEntercode(Long entercode);


	
	//@Query("SELECT e FROM Enterprise e WHERE e.eid.memberid = :eid")
    //Enterprise findByEid(@Param("eid") String eid);
}