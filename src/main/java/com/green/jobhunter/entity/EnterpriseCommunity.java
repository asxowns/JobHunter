package com.green.jobhunter.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
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
public class EnterpriseCommunity{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long ec_code;
	
	@ManyToMany
	@JoinColumn(name="member_id")
	@ToString.Exclude
	private Member writer;
	private String title;
	private String content;
	
}