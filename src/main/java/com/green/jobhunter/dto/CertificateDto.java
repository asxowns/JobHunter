package com.green.jobhunter.dto;

import java.time.LocalDate;

import lombok.Data;
@Data
public class CertificateDto {
	private Long certicode;
	private String publisher;
	private LocalDate issuedate;
	
}
