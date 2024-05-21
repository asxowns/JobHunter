package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Certificate;
@Repository
public interface CertificateRepository extends JpaRepository<Certificate, Long> {

}
