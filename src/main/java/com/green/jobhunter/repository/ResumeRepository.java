package com.green.jobhunter.repository;

import java.sql.Date;
import java.util.ArrayList;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import com.green.jobhunter.dto.TalentInfoDto;

import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Resume;

@Repository
public interface ResumeRepository extends JpaRepository<Resume, Long>{
	
	@Query(value = "SELECT r.title FROM resume r WHERE r.hid = :hid", nativeQuery=true)
	public String findTitle( @Param("hid") Member hid);
	
	@Query(value = "SELECT r FROM resume r WHERE r.hid = :hid", nativeQuery=true)
	public Resume findOneResume(@Param("hid") Member hid);
	
	public Resume findByResumecode(Long resumecode);
	
	public List<Resume> findByHid(Member hid);

  @Query(value = "SELECT r FROM resume r WHERE r.hid = :hid", nativeQuery=true)
	public Resume findOneResume(String memberid);

  @Query(value = "SELECT h.huntercode, h.hid, h.username, h.birth, h.gender, r.edutype, r.employmenttype FROM Hunter h JOIN Resume r ON r.hid = h.hid", nativeQuery = true)
    List<Object[]> findAllWithTalentInfoAsArray();

    default List<TalentInfoDto> findAllWithTalentInfo() {
        List<Object[]> results = findAllWithTalentInfoAsArray();
        List<TalentInfoDto> dtos = new ArrayList<>();
        for (Object[] result : results) {
            TalentInfoDto dto = new TalentInfoDto();
            dto.setHuntercode((Long) result[0]);
            dto.setHid((String) result[1]);
            dto.setUsername((String) result[2]);
            dto.setBirth((Date) result[3]);
            dto.setGender((char) result[4]);
            dto.setEdutype((String) result[5]);
            dto.setEmploymenttype((String) result[6]);
            dtos.add(dto);
        }
        return dtos;
    } 

}