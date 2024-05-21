package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.SubCategory;

@Repository
public interface SubCategoryRepository extends JpaRepository<SubCategory,Long> {
    
	@Query(value="SELECT sub FROM sub_category", nativeQuery=true )
	public List<String> findSubCategory();
	
	@Query(value="SELECT sub FROM sub_category sc WHERE sc.mccode = :mccode", nativeQuery=true )
	public List<String> findSubCategoryBymccode(@Param("mccode")Long mccode);
}
