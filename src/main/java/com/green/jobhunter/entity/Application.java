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
public class Application{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long app_code;
	
	@OneToOne
	@JoinColumn(name="post_code")
	@ToString.Exclude
	private Posting post_code;
	
	@OneToOne
	@JoinColumn(name="id")
	@ToString.Exclude
	private Member hid;
	
}