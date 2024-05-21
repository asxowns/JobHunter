package com.green.jobhunter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Cs;
import com.green.jobhunter.entity.Csreply;


@Repository
public interface CsReplyRepository extends JpaRepository<Csreply, Long>{

    List<Csreply> findAllByCscode(Cs cscode);
}