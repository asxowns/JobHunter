package com.green.jobhunter.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ResumeDto {
	private Long resumecode;
	private String title;
	private String eduname;
	private String edutype;
	private String edumajor;
	private String edustate;
	private LocalDate graduatedate;
	private String newOrExp;
	private LocalDate modifydate;
	private String photourl;
	private int desiredpay;
	private char publictype;
	
}
