package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Career;
import com.green.jobhunter.entity.CoverLetter;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Resume;
@Repository
public interface CoverLetterRepository extends JpaRepository<CoverLetter,Long>{

	@Query(value = "SELECT cl FROM coverLetter cl WHERE cl.resumecode = :r", nativeQuery=true)
	public CoverLetter findOneCoverLetter(@Param("r")Resume r);
	
	public CoverLetter findByResumecode(Resume resume);
}