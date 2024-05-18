package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.green.jobhunter.entity.Hunter;

public interface HunterRepository extends JpaRepository<Hunter,Long>{
	
	
	
}