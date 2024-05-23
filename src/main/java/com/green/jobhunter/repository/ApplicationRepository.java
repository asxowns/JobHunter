package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Application;
import com.green.jobhunter.entity.Posting;

@Repository
public interface ApplicationRepository extends JpaRepository<Application, Long> {
	
//	@Query(value="SELECT * FROM application WHERE postcode = :posting.postcode", nativeQuery = true)
	List<Application> findByPostcode(Posting postcode);
	
}