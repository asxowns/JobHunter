package com.green.jobhunter.dto;

import com.green.jobhunter.entity.Resume;

import lombok.Data;

@Data
public class DesiredAreaDto {
	private Long dacode;
	private Resume resumecode;
	private String area1;
	private String area2;
}
