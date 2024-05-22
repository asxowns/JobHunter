package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.green.jobhunter.entity.Community;
import com.green.jobhunter.entity.CommunityReply;

public interface Commu_replyRepository extends JpaRepository<CommunityReply, Long>{
	
	List<CommunityReply> findByCmcode(@Param("cmcode") Community cmcode);
	
}