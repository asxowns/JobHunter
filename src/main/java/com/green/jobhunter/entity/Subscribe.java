package com.green.jobhunter.entity;

import jakarta.persistence.Entity;
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
public class Subscribe {
	@Id
	private long subs_code;

	@ManyToOne
	@JoinColumn(name="eid")
	@ToString.Exclude
	private Enterprise eid;
	// 하나의 기업에 하나의 
	
	
	
	@ManyToOne
	@JoinColumn(name="hid")
	@ToString.Exclude
	private Member hid;
}
