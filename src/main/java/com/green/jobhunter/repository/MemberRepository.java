package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.green.jobhunter.entity.Member;

public interface MemberRepository extends JpaRepository<Member, String> {
    @Query("SELECT m FROM Member m WHERE m.member_id = :member_id AND m.role = :role")
    Member findByMemberIdAndRole(@Param("member_id") String member_id, @Param("role") char role);
}