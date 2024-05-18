package com.green.jobhunter.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Inform{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long if_code;
	
	@ManyToOne
	@JoinColumn(name="member_id")
	@ToString.Exclude
	private Member sender;
	
	@ManyToOne
	@JoinColumn(name="member_id")
	@ToString.Exclude
	private Member resiever;
	private String message;
	private String url;
	private LocalDateTime informdate;
	
}