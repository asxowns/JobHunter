package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Cs;
import com.green.jobhunter.entity.Member;

@Repository
public interface CsRepository extends JpaRepository<Cs, Long>{


	List<Cs> findByTypeAndPublictype(char type, char publictype);

	List<Cs> findByHid(Member member);

	Cs findByCscode(Long cscode);
	
}