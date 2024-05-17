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
public class Resume{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long resume_code;
	
	@ManyToOne
	@JoinColumn(name="member_id")
	@ToString.Exclude
	private Member hid;
	private String edu_name;
	private String edu_type;
	private String edu_major;
	private String edu_state;
	private String graduate_date;
	private String employment_type;
	private LocalDateTime modifydate;
	private String photourl;
	private int desire_pay;
	private char public_type;
	
	
}