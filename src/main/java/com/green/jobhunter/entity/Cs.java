package com.green.jobhunter.entity;

import java.time.LocalDateTime;

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
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cs{

	

	public int getCs_code() {
		return cs_code;
	}

	public void setCs_code(int cs_code) {
		this.cs_code = cs_code;
	}


	

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public char getType() {
		return type;
	}

	public void setType(char type) {
		this.type = type;
	}

	public LocalDateTime getCs_date() {
		return cs_date;
	}

	public void setCs_date(LocalDateTime cs_date) {
		this.cs_date = cs_date;
	}

	public char getResult() {
		return result;
	}

	public void setResult(char result) {
		this.result = result;
	}

	public char getPublic_type() {
		return public_type;
	}

	public void setPublic_type(char public_type) {
		this.public_type = public_type;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cs_code;
	
	

	@ManyToOne
	@JoinColumn(name="ID")
	//@ToString.Exclude
	private Member member;
	
	



	@Column(length = 20)
	private String title;
	
	@Column(length = 500)
	private String content;
	
	@Column(length = 2)
	private char type;
	
	private LocalDateTime cs_date;
	
	@Column(length = 1)
	private char result;
	
	@Column(length = 1)
	private char public_type;
	
}