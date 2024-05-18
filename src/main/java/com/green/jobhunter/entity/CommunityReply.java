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
public class CommunityReply{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long cmr_code;
	
	@OneToOne
	@JoinColumn(name="cmcode")
	@ToString.Exclude
	private Community cmcode;
	private String comment;
	
	@ManyToOne
	@JoinColumn(name="member_id")
	@ToString.Exclude
	private Member writer;
	
	
}