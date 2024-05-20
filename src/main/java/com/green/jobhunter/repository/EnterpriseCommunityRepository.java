package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.green.jobhunter.entity.EnterpriseCommunity;

public interface EnterpriseCommunityRepository extends JpaRepository<EnterpriseCommunity, Long>{
	
	EnterpriseCommunity findByEccode(Long eccode);
	
}