package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.EnterCommu_reply;
import com.green.jobhunter.entity.EnterpriseCommunity;

@Repository
public interface EnterCommu_replyRepository extends JpaRepository<EnterCommu_reply, Long>{
	
	List<EnterCommu_reply> findByEccode(EnterpriseCommunity enterpriseCommunity);
	
	@Query(value = "delete from EnterCommu_reply where eccode = :eccode", nativeQuery = true)
	void deleteByEccode(EnterCommu_reply enterCommuReply);
}