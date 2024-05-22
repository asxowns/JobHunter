package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.dto.HunterDto;
import com.green.jobhunter.entity.Hunter;
import com.green.jobhunter.entity.Member;
@Repository
public interface HunterRepository extends JpaRepository<Hunter,Long>{
	
	Hunter findByHid(Member hid);

	@Query(value = "UPDATE hunter SET username = :username, address = :address, tel1 = :tel1, email = :email", nativeQuery = true)
	Hunter updateHunter(HunterDto h);
}