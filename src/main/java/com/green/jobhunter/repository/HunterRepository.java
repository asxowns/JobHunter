package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Hunter;
import com.green.jobhunter.entity.Member;
@Repository
public interface HunterRepository extends JpaRepository<Hunter,Long>{
	
	Hunter findByHid(Member hid);

}