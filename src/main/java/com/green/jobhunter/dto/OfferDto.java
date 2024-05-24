package com.green.jobhunter.controller;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class OfferDto {

	private Long offercode;
	private String msg;
	private String managetel;
	private String result;
	private LocalDateTime deadline;
}
