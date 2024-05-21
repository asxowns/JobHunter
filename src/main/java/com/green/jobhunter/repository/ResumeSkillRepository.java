package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.ResumeSkill;
@Repository
public interface ResumeSkillRepository extends JpaRepository<ResumeSkill,Long>{

	
}