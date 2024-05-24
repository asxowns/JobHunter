package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Chat;
import com.green.jobhunter.entity.Member;

import java.util.List;
@Repository
public interface ChatRepository extends JpaRepository<Chat, Long> {
    List<Chat> findAllByHid(Member hid);

    @Query(value = "select c.* from chat c group by hid order by timelog DESC ", nativeQuery = true)
    List<Chat> findAllGroupByHid();
    
}