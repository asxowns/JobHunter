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
public class Cs{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long cscode;
	
	@ManyToOne
	@JoinColumn(name="hid")
	@ToString.Exclude
	private Member hid;
	private String title;
	private String content;
	private char type;
	private LocalDateTime csdate;
	private char result;
	private char publictype;
	
	public Long getCscode() {
		return cscode;
	}
	public void setCscode(Long cscode) {
		this.cscode = cscode;
	}
	public Member getHid() {
		return hid;
	}
	public void setHid(Member hid) {
		this.hid = hid;
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
	public LocalDateTime getCsdate() {
		return csdate;
	}
	public void setCsdate(LocalDateTime csdate) {
		this.csdate = csdate;
	}
	public char getResult() {
		return result;
	}
	public void setResult(char result) {
		this.result = result;
	}
	public char getPublictype() {
		return publictype;
	}
	public void setPublictype(char publictype) {
		this.publictype = publictype;
	}
	
	
	
	
}