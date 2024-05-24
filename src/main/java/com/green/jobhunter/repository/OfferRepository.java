package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.green.jobhunter.entity.Offer;

public interface OfferRepository extends JpaRepository<Offer, Long>{

	@Query(value="SELECT * FROM offer o WHERE o.hid = :hid", nativeQuery = true)
	List<Offer> findByHid(@Param("hid") String hid); 
}
