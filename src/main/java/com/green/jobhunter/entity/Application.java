package com.green.jobhunter.entity;

import jakarta.persistence.CascadeType;
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
public class Application{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long appcode;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="postcode")
	@ToString.Exclude
	private Posting postcode;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="hid")
	@ToString.Exclude
	private Member hid;

	private String result;
	
}