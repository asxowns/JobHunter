package com.green.jobhunter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class JobhunterApplication {

	public static void main(String[] args) {
		SpringApplication.run(JobhunterApplication.class, args);
	}

}
