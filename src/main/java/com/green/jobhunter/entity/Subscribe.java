package com.green.jobhunter.entity;

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
public class Subscribe {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long sub_scode;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="entercode")
    //@JoinColumn(name="eid", referencedColumnName="eid") // eid를 외래 키로 사용
	@ToString.Exclude
	private Enterprise eid;
	// 하나의 기업에 하나의 
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="hid")
	@ToString.Exclude
	private Member hid;
	
}
