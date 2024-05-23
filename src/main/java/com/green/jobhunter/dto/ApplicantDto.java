package com.green.jobhunter.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Posting;

import jakarta.persistence.CascadeType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class ApplicantDto {
	//구직자정보
	private Long huntercode;
	private String hid; 
    private String username;
    private Date birth; 
    private char gender; 
    private String edutype;
    private String employmenttype;
    
    private String title; //이력서제목 
    
    private Long appcode;
	private Long postcode; 
	private String result; //지원결과

	public ApplicantDto(Object[] arr) {
        this.huntercode = (Long) arr[0];
        this.hid = (String) arr[1];
        this.username = (String) arr[2];
        this.birth = (Date) arr[3];
        this.gender = (char) arr[4];
        this.edutype = (String) arr[5];
        this.employmenttype = (String) arr[6];
        this.title = (String) arr[7];
        this.appcode = (Long) arr[8];
        this.postcode = (Long) arr[9];
        this.result = (String) arr[10];
    }

}
