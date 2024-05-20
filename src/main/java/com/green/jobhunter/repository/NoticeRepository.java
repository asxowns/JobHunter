package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Notice;

@Repository
public interface NoticeRepository extends JpaRepository<Notice, Long> {
    Notice findByNtcode(Long ntcode);
    
}