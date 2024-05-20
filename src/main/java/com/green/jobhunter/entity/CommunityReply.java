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
public class CommunityReply extends BaseTimeEntity{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long cmrcode;
	
	@OneToOne
	@JoinColumn(name="cmcode")
	@ToString.Exclude
	private Community cmcode;
	private String comment;
	
	@ManyToOne
	@JoinColumn(name="writer")
	@ToString.Exclude
	private Member writer;
	
}