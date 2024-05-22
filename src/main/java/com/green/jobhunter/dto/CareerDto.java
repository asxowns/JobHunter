package com.green.jobhunter.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class CareerDto {
	private Long carcode;
	private String companyname;
	private LocalDate cardate;
	private LocalDate enddate;
	private String industry;
	private String position;
	private String job;
	private String work;
	private String salary;
}
