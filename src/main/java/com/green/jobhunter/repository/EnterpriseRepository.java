package com.green.jobhunter.repository;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.dto.OfferDto;
import com.green.jobhunter.entity.Enterprise;

@Repository
public interface EnterpriseRepository extends JpaRepository<Enterprise, Long> {
	//Enterprise findByEid_Memberid(String eid);
	
	@Query(value = "SELECT * FROM enterprise WHERE eid = :eid", nativeQuery = true)
	Enterprise findByEid(@Param("eid") String id);
	
	Enterprise findByEntercode(Long entercode);

	Enterprise findByCompanyname(String companyname);

	
	@Query("SELECT e FROM Enterprise e WHERE e.eid.memberid = :eid")
    Enterprise findByEid2(@Param("eid") String eid);
	
	@Query(value = "SELECT o.*,e.companyname FROM offer o JOIN enterprise e ON o.eid = e.eid WHERE e.eid = o.eid AND o.hid = :hid", nativeQuery = true)
	List<Object[]> findByOfferDtoAsArray(@Param("hid") String hid);

	default List<OfferDto> findByOfferDto(String hid){
		List<Object[]> results = findByOfferDtoAsArray(hid);
		List<OfferDto> dtos = new ArrayList<>();
		for( Object[] result : results) {
			OfferDto dto = new OfferDto();
			dto.setOffercode((Long)result[0]);
			dto.setDeadline((Date)result[1]);
			dto.setManagetel((String) result[2]);
			dto.setMsg((String) result[3]);
			dto.setResult((String) result[4]);
			dto.setCompanyname((String) result[7]);
			dtos.add(dto);
		}
		return dtos;
	}
	

}