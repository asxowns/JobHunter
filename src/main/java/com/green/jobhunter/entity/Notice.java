package com.green.jobhunter.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Notice{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long nt_code;
	private String title;
	private LocalDateTime regdate;
	private String content;
	
	
}