package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.DesiredArea;
@Repository
public interface DesiredIndustryRepository extends JpaRepository<DesiredArea, Long>{
	
	
	
}