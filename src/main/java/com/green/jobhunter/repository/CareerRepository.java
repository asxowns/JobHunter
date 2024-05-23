package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Career;

@Repository
public interface CareerRepository extends JpaRepository<Career,Long>{

	@Query(value = "SELECT c FROM career c WHERE c.hid = :hid", nativeQuery=true)
	public Career findOneCareer(String memberid);
	
}