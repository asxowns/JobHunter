package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.EnterpriseCommunity;

@Repository
public interface EnterpriseCommunityRepository extends JpaRepository<EnterpriseCommunity, Long>{
	
	EnterpriseCommunity findByEccode(Long eccode);
	Page<EnterpriseCommunity> findByTitleContaining(String keyword, Pageable pageable);
	
	@Query(value = "delete from EnterpriseCommunity where eccode = :eccode", nativeQuery = true)
	void deleteByEccode(@Param("eccode") Long eccode);

	@Query(value = "SELECT COUNT(r.ecrcode) AS reply_count "+
	"FROM enterprise_community c "+
	"LEFT JOIN enter_commu_reply r ON c.eccode = r.eccode "+
	"GROUP BY c.eccode "+
	"ORDER BY c.modifieddate DESC",nativeQuery = true)
    List<String> countReplys(Pageable pageable);

	@Query(value="SELECT COUNT(r.ecrcode) AS reply_count "+
	"FROM enterprise_community c "+
	"LEFT JOIN enter_commu_reply r ON c.eccode = r.eccode "+
	"WHERE c.title LIKE '%:keyword%' "+
	"GROUP BY c.eccode "+
	"ORDER BY c.modifieddate DESC",nativeQuery = true)
	List<String> countReplySearch(@Param("keyword") String keyword, Pageable pageable);
}