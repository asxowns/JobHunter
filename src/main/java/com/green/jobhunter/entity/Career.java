package com.green.jobhunter.entity;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
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
public class Career{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long carcode;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="resumecode")
	@ToString.Exclude
	private Resume resumecode;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="hid")
	@ToString.Exclude
	private Member hid;
	private String companyname;

	//@Column(columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP",  nullable = false)
	private LocalDate cardate;
	
	//@Column(columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP",  nullable = false)
	private LocalDate enddate;
	
	private String industry;
	private String position;
	private String job;
	private String working;
	private String work;
	private String salary;
	
}