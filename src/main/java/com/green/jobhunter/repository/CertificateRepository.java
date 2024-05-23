package com.green.jobhunter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.green.jobhunter.entity.Certificate;
import com.green.jobhunter.entity.DesiredArea;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Resume;
@Repository
public interface CertificateRepository extends JpaRepository<Certificate, Long> {
	
	@Query(value = "SELECT ctf FROM certificate ctf WHERE ctf.hid = :r", nativeQuery=true)
	public Certificate findOneCertificate(@Param("r")Resume r);
	
	public Certificate findByResumecode(Resume resume);
}
