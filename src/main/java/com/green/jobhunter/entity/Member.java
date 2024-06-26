package com.green.jobhunter.entity;
import java.time.LocalDate;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Member{
	@Id
    @Column(length = 20) // member_id 필드의 길이 설정
    private String memberid;
    
    @Column(length = 16) // password 필드의 길이 설정
    private String password;
    
    private char role;

    @Column(columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP", nullable = false)
	private LocalDate regdate;

	

}