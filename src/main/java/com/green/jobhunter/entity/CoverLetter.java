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
import lombok.ToString;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CoverLetter{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long cl_code;
	
	@OneToOne
	@JoinColumn(name="resume_code")
	@ToString.Exclude
	private Resume resume_code;
	private String title;
	private String content;
	
}