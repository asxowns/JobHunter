package com.green.jobhunter.entity;

import java.time.LocalDateTime;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
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
public class Inform{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long ifcode;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="sender")
	@ToString.Exclude
	private Member sender;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="resiever")
	@ToString.Exclude
	private Member resiever;
	private String message;
	private String url;
	
	@Column(columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP",  nullable = false)
	private LocalDateTime informdate;
	
}