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
public class PostingSkill{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long pscode;
	
	@ManyToOne
	@JoinColumn(name="postcode")
	@ToString.Exclude
	private Posting postcode;
	
	private String stack;
	
}