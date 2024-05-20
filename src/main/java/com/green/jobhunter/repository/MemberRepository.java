package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.green.jobhunter.entity.Member;

public interface MemberRepository extends JpaRepository<Member, String>{
	

	
	@Query(value = "select * from Member where member_id = :memberid and password = :password", nativeQuery = true)
	Member findByMem(@Param("memberid") String memberid, @Param("password") String password);
	
	
}
