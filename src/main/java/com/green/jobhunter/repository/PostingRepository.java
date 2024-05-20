package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.green.jobhunter.entity.Posting;

public interface PostingRepository extends JpaRepository<Posting, Long> {

	@Query(value = "SELECT * FROM posting WHERE eid = :eid", nativeQuery = true)
	List<Posting> findByEid(@Param("eid") String eid);
}