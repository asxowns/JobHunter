package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Resume;

@Repository
public interface ResumeRepository extends JpaRepository<Resume, Long>{
	
	
	
}