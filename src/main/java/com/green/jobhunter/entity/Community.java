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
public class Community extends BaseTimeEntity{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long cmcode;
	
	@ManyToOne
	@JoinColumn(name="writer")
	@ToString.Exclude
	private Member writer;
	private String title;
	private String content;
	private int boardtype;
	
	
}