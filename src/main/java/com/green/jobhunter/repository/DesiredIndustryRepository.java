package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Certificate;
import com.green.jobhunter.entity.DesiredIndustry;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Resume;
@Repository
public interface DesiredIndustryRepository extends JpaRepository<DesiredIndustry, Long>{
	
	@Query(value = "SELECT di FROM desiredIndustry di WHERE di.resumecode = :r", nativeQuery=true)
	public DesiredIndustry findOneDi(@Param("r")Resume r);
	
	public DesiredIndustry findByResumecode(Resume resume);
	
}