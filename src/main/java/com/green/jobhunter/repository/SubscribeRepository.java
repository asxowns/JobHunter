package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.green.jobhunter.entity.Subscribe;

public interface SubscribeRepository extends JpaRepository<Subscribe,Long>{

	
	@Query(value = "DELETE FROM subscribe WHERE entercode = :entercode", nativeQuery = true)
	void deleteByEntercode(@Param("entercode") Long entercode);
}