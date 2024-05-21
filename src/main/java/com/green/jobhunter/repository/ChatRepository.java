package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Chat;

@Repository
public interface ChatRepository extends JpaRepository<Chat, Long> {

    
}