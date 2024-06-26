package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.DesiredArea;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Resume;
@Repository
public interface DesiredAreaRepository extends JpaRepository<DesiredArea, Long>{
	
	public DesiredArea findByResumecode(Resume resume);
}