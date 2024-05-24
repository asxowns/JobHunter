package com.green.jobhunter.dto;

import java.sql.Date;

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
	private Date deadline;
	private String companyname;
}
