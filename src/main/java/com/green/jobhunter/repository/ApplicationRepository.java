package com.green.jobhunter.repository;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.dto.ApplicantDto;
import com.green.jobhunter.entity.Application;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Posting;

@Repository
public interface ApplicationRepository extends JpaRepository<Application, Long> {
	
//	@Query(value="SELECT * FROM application WHERE postcode = :posting.postcode", nativeQuery = true)
	List<ApplicantDto> findByPostcode(Posting postcode);
	
	//해당공고의 지원자정보
		@Query(value = "SELECT h.huntercode, h.hid, h.username, h.birth, h.gender, r.edutype, r.employmenttype, r.title, a.appcode, a.postcode, a.result FROM hunter h JOIN resume r ON h.hid = r.hid JOIN application a ON r.hid = a.hid", nativeQuery = true)
	    List<Object[]> findAllWithApplicantDtoAsArray();
	    default List<ApplicantDto> findAllWithApplicantDto() {
	        List<Object[]> results = findAllWithApplicantDtoAsArray();
	        List<ApplicantDto> dtos = new ArrayList<>();
	        for (Object[] result : results) {
	        	ApplicantDto dto = new ApplicantDto();
	        	dto.setHuntercode((Long) result[0]);
	        	dto.setHid((String) result[1]);
	        	dto.setUsername((String) result[2]);
	        	dto.setBirth ((Date) result[3]);
	        	dto.setGender((char) result[4]);
	        	dto.setEdutype((String) result[5]);
	        	dto.setEmploymenttype((String) result[6]);
	        	dto.setTitle((String) result[7]);
	        	dto.setAppcode((Long) result[8]);
	        	dto.setPostcode((Long) result[9]);
	        	dto.setResult((String) result[10]);
	            dtos.add(dto);
	        }
	        return dtos;
	    }
	
	//hid가 현재 로그인된 구직자의 member_id와 같을 때 입사지원 리스트 불러오기 
	List<Application> findByHid(Member member);
	
	@Query(value="SELECT * FROM application  WHERE postcode = :posting.postcode", nativeQuery = true)
	Application  findByPostcode(List<Posting> postList);
}