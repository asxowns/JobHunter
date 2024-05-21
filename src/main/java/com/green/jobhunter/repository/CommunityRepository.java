package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.green.jobhunter.entity.Community;

public interface CommunityRepository extends JpaRepository<Community, Long> {
	
	Community findByCmcode(Long cmcode);
}