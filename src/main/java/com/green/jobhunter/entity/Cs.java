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
public class Cs{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long cs_code;
	
	@ManyToOne
	@JoinColumn(name="hid")
	@ToString.Exclude
	private Member hid;
	private String title;
	private String content;
	private char type;
	private LocalDateTime cs_date;
	private char result;
	private char public_type;
	
}