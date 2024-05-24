package com.green.jobhunter.entity;

import java.sql.Date;

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
public class Offer{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long offercode;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="eid")
	@ToString.Exclude
	private Member eid;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="hid")
	@ToString.Exclude
	private Member hid;
	private String msg;
	private String managetel;
	private String result;

	private Date deadline;
}