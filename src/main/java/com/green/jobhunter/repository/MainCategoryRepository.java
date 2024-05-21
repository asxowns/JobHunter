package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.MainCategory;

@Repository
public interface MainCategoryRepository extends JpaRepository<MainCategory,Long> {
    
}
