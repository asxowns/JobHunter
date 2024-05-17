package com.green.jobhunter.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
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
public class Posting{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long post_code;
	
	@OneToOne
	@JoinColumn(name="id")
	@ToString.Exclude
	private Member eid;
	private String title;
	private int head_count;
	private String edu_type;
	private String career;
	private String employment_type;
	private int pay;
	private String area;
	private String industry;
	private String job;
	private LocalDateTime deadline;
	private String manager_tel;
	private String main_content;
	private String main_url;
	
}