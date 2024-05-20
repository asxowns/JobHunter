package com.green.jobhunter.entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.ToString;

public class ResumeSkill{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long skillcode;
	
	@OneToOne
	@JoinColumn(name="resumecode")
	@ToString.Exclude
	private Resume resumecode;
	
	@ManyToOne
	@JoinColumn(name="hid")
	@ToString.Exclude
	private Member hid;
	private String stack;
	
}