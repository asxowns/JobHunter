package com.green.jobhunter.repository;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.green.jobhunter.entity.Application;
import com.green.jobhunter.dto.ApplicantDto;
import com.green.jobhunter.dto.TalentInfoDto;

import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Posting;

public interface PostingRepository extends JpaRepository<Posting, Long> {

	@Query(value = "SELECT * FROM posting WHERE eid = :eid", nativeQuery = true)
	List<Posting> findByEid(@Param("eid") String eid);

	Posting findByPostcode(Long postcode);

	Posting findByPostcode(Posting posting);

	// 해당 채용공고 삭제
	@Query(value = "DELETE FROM application WHERE postcode = :postcode", nativeQuery = true)
	void deleteBypostcode(@Param("postcode") Long postcode);

	@Query(value = "DELETE FROM posting_skill WHERE postcode= :postcode", nativeQuery = true)
	void deleteBypostcode2(@Param("postcode") Long postcode);

	@Query(value = "DELETE FROM posting WHERE postcode= :postcode", nativeQuery = true)
	void deleteBypostcode3(@Param("postcode") Long postcode);

//	@Query("SELECT p FROM Posting p WHERE (:eid IS NULL OR p.eid = :eid) AND " +
//		       "(:area IS NULL OR p.area = :area) AND " +
//		       "(:career IS NULL OR p.career = :career) AND " +
//		       "(:edutype IS NULL OR p.edutype = :edutype)")
//  List<Posting> findByEidAndAreaAndCareerAndEdutype(@Param("eid") Member eid, 
//		        @Param("area") String area, 
//		        @Param("career") String career, 
//		        @Param("edutype") String edutype);

	@Query(value = "select p.* from enterprise e, posting p "
			+ "where p.eid=e.eid and (e.companyname like concat('%',:companyname,'%') or concat('%',:companyname,'%') is null) "
			+ "And (p.area LIKE concat('%',:area,'%') or concat('%',:area,'%') is null  ) And ( p.career=:career or :career is null ) "
			+ "And (p.edutype=:edutype or :edutype is null)", nativeQuery = true)
	List<Posting> findByCompanynameAndAreaAndCareerAndEdutype(@Param("companyname") String companyname,
			@Param("area") String area, @Param("career") String career, @Param("edutype") String edutype);

	List<Posting> findByEid(Member eid);

	@Query(value = "SELECT * FROM posting p WHERE p.postcode in (SELECT a.postcode from application a JOIN member m ON m.memberid = a.hid WHERE a.hid = :hid AND a.result = :result)", nativeQuery = true)
	List<Posting> findMyApplyList(@Param("hid") String hid, @Param("result") String result);

}