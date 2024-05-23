package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Community;

@Repository
public interface CommunityRepository extends JpaRepository<Community, Long> {
	
	Community findByCmcode(Long cmcode);
	Page<Community> findByTitleContaining(String keyword, Pageable pageable);
	
	@Query(value = "delete from community where cmcode = :cmcode", nativeQuery = true)
	void deleteByCmcode(@Param("cmcode") Long cmcode);

	@Query(value = "SELECT COUNT(cr.cmrcode) AS replyCount FROM community c "+
    "LEFT JOIN community_reply cr on c.cmcode = cr.cmcode GROUP BY c.modifieddate DESC",nativeQuery = true)
    List<String> countReplys(Pageable pageable);
	
	@Query(value ="SELECT COUNT(r.cmrcode) AS reply_count " + 
				"FROM community c " + 
				"LEFT JOIN community_reply r ON c.cmcode = r.cmcode " + 
				"WHERE c.title LIKE '%4%' " + 
				"GROUP BY c.cmcode " + 
				"ORDER BY c.modifieddate DESC" ,nativeQuery = true )
	List<String> countReplySearch(@Param("keyword")String keyword, Pageable pageable);
}