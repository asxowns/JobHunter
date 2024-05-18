package com.green.jobhunter.entity;

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
public class DesiredIndustry{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long di_code;
	
	@OneToOne
	@JoinColumn(name="resume_code")
	@ToString.Exclude
	private Resume resume_no;
	
	@ManyToOne
	@JoinColumn(name="member_id")
	@ToString.Exclude
	private Member hid;
	private String area1;
	private String area2;
}