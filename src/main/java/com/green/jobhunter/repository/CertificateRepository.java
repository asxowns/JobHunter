package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Certificate;
@Repository
public interface CertificateRepository extends JpaRepository<Certificate, Long> {
	
	@Query(value = "SELECT ctf FROM certificate ctf WHERE ctf.hid = :hid", nativeQuery=true)
	public Certificate findOneCertificate(String memberid);
}
