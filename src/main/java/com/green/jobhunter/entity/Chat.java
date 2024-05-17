package com.green.jobhunter.entity;

import java.time.LocalDateTime;

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
public class Chat{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long ch_code;
	
	@ManyToOne
	@JoinColumn(name="member_id")
	@ToString.Exclude
	private Member ID;
	private String message;
	
	@ManyToOne
	@JoinColumn(name="member_id")
	@ToString.Exclude
	private Member writer_manager;
	private LocalDateTime timelog;
}