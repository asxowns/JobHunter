package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Career;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Resume;

@Repository
public interface CareerRepository extends JpaRepository<Career,Long>{

	@Query(value = "SELECT c FROM career c WHERE c.resumecode = :r", nativeQuery=true)
	public Career findOneCareer(@Param("r")Resume r);
	
	public Career findByResumecode(Resume resume);
	
}