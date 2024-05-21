package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Resume;

@Repository
public interface ResumeRepository extends JpaRepository<Resume, Long>{
	
	@Query(value = "SELECT r.title FROM resume r WHERE r.hid = :hid", nativeQuery=true)
	public String findTitle( @Param("hid") Member hid);
	
	
}