package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Resume;
import com.green.jobhunter.entity.ResumeSkill;
@Repository
public interface ResumeSkillRepository extends JpaRepository<ResumeSkill,Long>{

	@Query(value = "SELECT rs FROM resumeSkill rs WHERE rs.resumecode = :r", nativeQuery=true)
	public ResumeSkill findOneResumeSkill(@Param("r")Resume r);
	
	public ResumeSkill findByResumecode(Resume resume);
}