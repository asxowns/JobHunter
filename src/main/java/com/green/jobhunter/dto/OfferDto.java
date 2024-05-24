package com.green.jobhunter.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class OfferDto {
	
	private Long offercode;
	private String companyname;
	private String msg;
	private String managetel;
	private String result;
	private LocalDateTime deadline;
}
