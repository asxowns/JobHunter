package com.green.jobhunter.entity;

import java.sql.Date;
import java.time.LocalDate;

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
public class Posting{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long postcode;
	
	@ManyToOne
	@JoinColumn(name="eid")
	@ToString.Exclude
	private Member eid;
	private String title;
	private int headcount;
	private String edutype;
	private String career;
	private String employmenttype;
	private int pay;
	private String area;
	private String industry;
	private String job;
	private LocalDate deadline;
	private String managertel;
	private String maincontent;
	private String mainurl;

	@Column(columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP" , nullable = false)
    private Date regdate;
	
}