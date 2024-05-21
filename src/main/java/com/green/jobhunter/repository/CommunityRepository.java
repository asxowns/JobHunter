package com.green.jobhunter.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Community;

@Repository
public interface CommunityRepository extends JpaRepository<Community, Long> {
	
	Community findByCmcode(Long cmcode);
	Page<Community> findByTitleContaining(String keyword, Pageable pageable);
	
	@Query(value = "delete from community where cmcode = :cmcode", nativeQuery = true)
	void deleteByCmcode(@Param("cmcode") Long cmcode);
	
}