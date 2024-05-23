package com.green.jobhunter.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class TalentInfoDto {

	private Long huntercode;
    private String hid;
    private String username;
    private Date birth;
    private char gender;
    private String edutype;
    private String employmenttype;
	
	public TalentInfoDto(Object[] arr) {
        this.huntercode = (Long) arr[0];
        this.hid = (String) arr[1];
        this.username = (String) arr[2];
        this.birth = (Date) arr[3];
        this.gender = (char) arr[4];
        this.edutype = (String) arr[5];
        this.employmenttype = (String) arr[6];
    }
}
