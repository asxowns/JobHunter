package com.green.jobhunter.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FavoriteDto {
	private String companyname;
	private String title;
	private Long favorcode;
	
	public FavoriteDto(Object[] arr) {
        this.companyname = (String) arr[0];
        this.title = (String) arr[1];
        this.favorcode = (Long) arr[2];
    }
}
