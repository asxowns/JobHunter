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
public class Hunter{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long hunter_code;
	
	@OneToOne
	@JoinColumn(name="member_id")
	@ToString.Exclude
	private Member hid;
	private String user_name;
	private int age;
	private String tel;
	private String tel2;
	private String address;
	private String email;
	private char gender;
	private char military;
	private int report_num;
	
}