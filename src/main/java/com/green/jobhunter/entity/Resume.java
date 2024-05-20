package com.green.jobhunter.entity;

import java.sql.Date;

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
	private Long resumecode;
	
	@ManyToOne
	@JoinColumn(name="hid")
	@ToString.Exclude
	private Member hid;

	private String title;
	private String eduname;
	private String edutype;
	private String edumajor;
	private String edustate;
	private Date graduatedate;
	private String employmenttype;
	private Date modifydate;
	private String photourl;
	private int desirepay;
	private char publictype;
	
	
}