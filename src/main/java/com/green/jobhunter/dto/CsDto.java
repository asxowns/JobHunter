package com.green.jobhunter.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CsDto{
    private Long cscode;
    private String hid;
	private String title;
    private String content;
	private char type;
    private LocalDate csdate;
	private char result;
	private char publictype;
    private int between;

    public CsDto(LocalDate csdate) {
        this.csdate = csdate;
        this.between = (int) (LocalDate.now().toEpochDay() - this.csdate.toEpochDay());
    }


}
