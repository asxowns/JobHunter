package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.green.jobhunter.entity.Member;


public interface MemberRepository extends JpaRepository<Member, String>{
	

	
	@Query(value = "select * from Member where memberid = :memberid and password = :password", nativeQuery = true)
	Member findByMem(@Param("memberid") String memberid, @Param("password") String password);


    //@Query("SELECT m FROM Member m WHERE m.member_id = :member_id AND m.role = :role")
    //Member findByMemberIdAndRole(@Param("member_id") String member_id, @Param("role") char role);

    @Query("SELECT m FROM Member m WHERE m.memberid = :memberid AND m.role = :role")
    Member findByMemberIdAndRole(@Param("memberid") String memberid, @Param("role") char role);

    Member findByMemberid(String memberid);

}

