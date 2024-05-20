package com.green.jobhunter.entity;

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

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Enterprise{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long entercode;
	
	@OneToOne
	@JoinColumn(name="eid")
	//@ToString.Exclude
	private Member eid;
	private String companyname;
	private String size;
	private String corporatetype;
	private String businessitem;
	private String businessnumber;
	private String ceo;
	private String tel;
	private String address;
	private int empnum;
	private int sales;
	private String managername;
	private String managertel;
	private String manageremail;
	private int reportnum;
	
}