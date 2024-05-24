package com.green.jobhunter.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.dto.FavoriteDto;
import com.green.jobhunter.entity.Favorite;

@Repository
public interface FavoriteRepository extends JpaRepository<Favorite, Long> {
	@Query(value="SELECT e.companyname, p.title, f.favorcode FROM favorite f JOIN hunter h ON f.hid = h.hid JOIN posting p ON p.postcode = f.postcode JOIN enterprise e ON p.eid = e.eid WHERE h.hid = :hid", nativeQuery=true)
	List<Object[]> findByHidAsArray(@Param("hid") String hid);
	
	default List<FavoriteDto> findByHid(String hid) {
		List<Object[]> results = findByHidAsArray(hid);
		List<FavoriteDto> dtos = new ArrayList<>();
		for (Object[] result : results) {
			FavoriteDto dto = new FavoriteDto();
			dto.setCompanyname((String) result[0]);
			dto.setTitle((String) result[1]);
			dto.setFavorcode((Long) result[2]);
			dtos.add(dto);
		}
		return dtos;
	}
	
}