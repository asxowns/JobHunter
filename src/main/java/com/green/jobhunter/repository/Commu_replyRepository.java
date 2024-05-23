package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Community;
import com.green.jobhunter.entity.CommunityReply;

@Repository
public interface Commu_replyRepository extends JpaRepository<CommunityReply, Long>{
	
	List<CommunityReply> findByCmcode(Community community);
	
	@Query(value = "delete from community_reply where cmcode = :cmcode", nativeQuery = true)
	void deleteByCmcode(@Param("cmcode") CommunityReply cmcode);
	
}