package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.MainCtaegory;

@Repository
public interface MainCtaegoryRepository extends JpaRepository<MainCtaegory,Long> {
    
}
