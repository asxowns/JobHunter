package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.SubCategory;

@Repository
public interface SubCategoryRepository extends JpaRepository<SubCategory,Long> {
    
}
