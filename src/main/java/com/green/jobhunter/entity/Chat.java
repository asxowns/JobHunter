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
	private Long chcode;
	
	@ManyToOne
	@JoinColumn(name="hid")
	@ToString.Exclude
	private Member hid;
	private String message;
	
	@ManyToOne
	@JoinColumn(name="writermanager")
	@ToString.Exclude
	private Member writermanager;
	private LocalDateTime timelog;
}