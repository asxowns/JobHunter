package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.DesiredIndustry;
@Repository
public interface DesiredIndustryRepository extends JpaRepository<DesiredIndustry, Long>{
	
	@Query(value="SELECT main FROM maincategory", nativeQuery=true )
	public List<String> findMainCategory();
	
	@Query(value="SELECT middle FROM middlecategory", nativeQuery=true )
	public List<String> findMiddleCategory();
	
}