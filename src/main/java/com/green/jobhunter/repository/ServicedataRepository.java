package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Servicedata;

@Repository
public interface ServicedataRepository extends JpaRepository<Servicedata,Long>{

} 
