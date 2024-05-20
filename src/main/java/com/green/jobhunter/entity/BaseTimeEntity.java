package com.green.jobhunter.entity;

import java.time.LocalDate;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;

@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
@Getter
public abstract class BaseTimeEntity {

	@CreatedDate
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate regdate;
	
	@LastModifiedDate
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate modifieddate;
	
}
