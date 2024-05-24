package com.green.jobhunter.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OfferDto {
	
	private Long offercode;
	private String msg;
	private String managetel;
	private String result;
	private LocalDate deadline;
	private String companyname;
}
