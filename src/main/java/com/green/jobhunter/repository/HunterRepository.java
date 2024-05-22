package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.dto.HunterDto;
import com.green.jobhunter.entity.Hunter;
import com.green.jobhunter.entity.Member;
@Repository
public interface HunterRepository extends JpaRepository<Hunter,Long>{
	
	Hunter findByHid(Member hid);

	@Query(value = "UPDATE hunter SET username = :h.username, address = :h.address, tel1 = :h.tel1, email = :h.email WHERE hid=:h.hid", nativeQuery = true)
	Member updateHunter(@Param("h")HunterDto h);
}