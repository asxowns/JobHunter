package com.green.jobhunter.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.EnterpriseCommunity;

@Repository
public interface EnterpriseCommunityRepository extends JpaRepository<EnterpriseCommunity, Long>{
	
	EnterpriseCommunity findByEccode(Long eccode);
	Page<EnterpriseCommunity> findByTitleContaining(String keyword, Pageable pageable);
	
	@Query(value = "delete from EnterpriseCommunity where eccode = :eccode", nativeQuery = true)
	void deleteByEccode(@Param("eccode") Long eccode);
}