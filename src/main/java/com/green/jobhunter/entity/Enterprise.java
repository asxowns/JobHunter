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
public class Enterprise{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long enter_code;
	
	@OneToOne
	@JoinColumn(name="member_id")
	@ToString.Exclude
	private Member eid;
	private String company_name;
	private String size;
	private String corporate_type;
	private String business_item;
	private String business_number;
	private String ceo;
	private String tel;
	private String address;
	private int emp_num;
	private int sales;
	private String manager_name;
	private String manager_tel;
	private String manager_email;
	private int report_num;
	
}