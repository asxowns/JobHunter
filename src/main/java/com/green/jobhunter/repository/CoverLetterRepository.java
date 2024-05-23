package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.CoverLetter;
@Repository
public interface CoverLetterRepository extends JpaRepository<CoverLetter,Long>{

	@Query(value = "SELECT cl FROM coverLetter cl WHERE cl.hid = :hid", nativeQuery=true)
	public CoverLetter findOneCoverLetter(String memberid);
}