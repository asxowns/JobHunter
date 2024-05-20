package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.green.jobhunter.entity.Member;

public interface MemberRepository extends JpaRepository<Member, String> {

}