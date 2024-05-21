package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Posting;

public interface PostingRepository extends JpaRepository<Posting, Long> {

	@Query(value = "SELECT * FROM posting WHERE eid = :eid", nativeQuery = true)
	List<Posting> findByEid(@Param("eid") String eid);
	
	@Query(value = "")
	Posting findByPostcode(Long postcode);
	//해당 채용공고 삭제
	@Query(value = "DELETE FROM application WHERE postcode = :postcode", nativeQuery = true)
	void deleteBypostcode(@Param("postcode") Long postcode);
	
	@Query(value = "DELETE FROM posting_skill WHERE postcode= :postcode", nativeQuery = true)
	void deleteBypostcode2(@Param("postcode") Long postcode);
	
	@Query(value = "DELETE FROM posting WHERE postcode= :postcode", nativeQuery = true)
	void deleteBypostcode3(@Param("postcode") Long postcode);
	

}