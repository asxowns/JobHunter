package com.green.jobhunter.entity;

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
public class Certificate{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long certi_code;
	
	@ManyToOne
	@JoinColumn(name="resume_no")
	@ToString.Exclude
	private Resume resume_no;
	
	@ManyToOne
	@JoinColumn(name="member_id")
	@ToString.Exclude
	private Member hid;
	
}