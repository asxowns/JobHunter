package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Faq;
@Repository
public interface FaqRepository extends JpaRepository<Faq, Long>{

}

