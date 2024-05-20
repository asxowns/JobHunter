package com.green.jobhunter.repository;

import java.util.stream.IntStream;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.green.jobhunter.entity.Community;

@SpringBootTest
public class CommunityRepositoryTest {

	@Autowired
	private CommunityRepository comRepo;
	
	
	@Test
	public void insert() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			
			
			Community community = Community.builder()
					.title("제목제목제목.." + i)
					.content("내용내용내용내용..." + i)
					.build();
			comRepo.save(community);
		});
	}
}
