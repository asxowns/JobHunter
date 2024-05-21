package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.DesiredIndustry;
@Repository
public interface DesiredIndustryRepository extends JpaRepository<DesiredIndustry, Long>{
	
	

	
}