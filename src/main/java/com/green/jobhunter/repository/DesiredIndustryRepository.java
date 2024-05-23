package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.DesiredIndustry;
@Repository
public interface DesiredIndustryRepository extends JpaRepository<DesiredIndustry, Long>{
	
	@Query(value = "SELECT di FROM desiredIndustry di WHERE di.hid = :hid", nativeQuery=true)
	public DesiredIndustry findOneDi(String memberid);
	

	
}