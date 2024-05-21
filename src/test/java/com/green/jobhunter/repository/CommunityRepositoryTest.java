package com.green.jobhunter.repository;

import java.util.stream.IntStream;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.green.jobhunter.entity.Community;
import com.green.jobhunter.entity.EnterpriseCommunity;

@SpringBootTest
public class CommunityRepositoryTest {

	@Autowired
	private CommunityRepository comRepo;
	
	@Autowired
	private EnterpriseCommunityRepository entRepo;
	
	
	@Test
	public void insert() {
		IntStream.rangeClosed(1, 2).forEach(i -> {
			
			Community community = Community.builder()
					.title("제목제목제목.." + i)
					.content("내용내용내용내용..." + i)
					.build();
			comRepo.save(community);
		});
	}
	
	@Test
	public void insert2() {
		IntStream.rangeClosed(1, 2).forEach(i -> {
			
			EnterpriseCommunity community = EnterpriseCommunity.builder()
					.title("기업기업제목.." + i)
					.content("기업기업내용내용..." + i)
					.build();
			entRepo.save(community);
		});
	}
}
