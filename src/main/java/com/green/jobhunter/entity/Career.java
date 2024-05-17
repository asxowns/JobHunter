package com.green.jobhunter.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
public class Career{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long car_code;
	
	@ManyToOne
	@JoinColumn(name="resume_no")
	@ToString.Exclude
	private Resume resume_no;
	
	@ManyToOne
	@JoinColumn(name="id")
	@ToString.Exclude
	private Member hid;
	private String companyname;
	private LocalDateTime cardate;
	private int duration;
	private String industry;
	private String position;
	private String job;
	
}