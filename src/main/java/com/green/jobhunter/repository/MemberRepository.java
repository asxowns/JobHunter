package com.green.jobhunter.repository;

import java.util.List;
import java.time.LocalDate;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.green.jobhunter.entity.Member;

public interface MemberRepository extends JpaRepository<Member, String>{
	
	@Query(value = "select * from Member where memberid = :memberid and password = :password", nativeQuery = true)
	Member findByMem(@Param("memberid") String memberid, @Param("password") String password);
    
	@Query(value = "select * from Member where memberid = :memberid", nativeQuery = true)
	Member findByMemId(@Param("memberid") String memberid);

    @Query("SELECT m FROM Member m WHERE m.memberid = :memberid AND m.role = :role")
    Member findByMemberIdAndRole(@Param("memberid") String memberid, @Param("role") char role);

    Member findByMemberid(String memberid);

	@Query(value = "select * from Member where memberid LIKE %:memberid%", nativeQuery = true)
	List<Member> searchByMemberid(@Param("memberid") String memberid);
	
	@Query(value = "SELECT COUNT(*) AS count FROM member "
	+" WHERE regdate >= NOW() - INTERVAL 7 DAY AND regdate <= NOW() "
	+" GROUP BY DATE(regdate) ORDER BY DATE(regdate);", nativeQuery = true)
	List<String> weekRegistCount();

	@Query(value = "SELECT DATE(regdate) AS date FROM member "
	+" WHERE regdate >= NOW() - INTERVAL 7 DAY AND regdate <= NOW() "
	+" GROUP BY DATE(regdate) ORDER BY DATE(regdate);", nativeQuery = true)
	List<String> weekRegistDate();
}