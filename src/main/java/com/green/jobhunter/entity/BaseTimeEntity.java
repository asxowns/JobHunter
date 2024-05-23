package com.green.jobhunter.entity;

import java.time.LocalDateTime;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Column;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;

@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
@Getter
public abstract class BaseTimeEntity {

	@CreatedDate
	@JsonFormat(shape = JsonFormat.Shape.STRING, 
    pattern = "yyyy-MM-dd HH:mm:ss", 
    timezone = "Asia/Seoul")
	@Column(columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP", nullable = false)
	private LocalDateTime regdate;
	
	@LastModifiedDate
	@JsonFormat(shape = JsonFormat.Shape.STRING, 
    pattern = "yyyy-MM-dd HH:mm:ss", 
    timezone = "Asia/Seoul")
	@Column(columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP", nullable = false)
	private LocalDateTime modifieddate;
	
}
