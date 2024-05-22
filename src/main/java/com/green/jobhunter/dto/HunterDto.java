package com.green.jobhunter.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class HunterDto {
	private Long huntercode;
	private String username;
	private LocalDate birth;
	private int age;
	private String tel;
	private String tel2;
	private String address;
	private String email;
	private char gender;
	private char military;
	private int reportnum;
	private String newOrExp;
		
}
