package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Hunter;
@Repository
public interface HunterRepository extends JpaRepository<Hunter,Long>{
	
	
}