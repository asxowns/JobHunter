package com.green.jobhunter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.jobhunter.repository.CommunityRepository;

@Service
public class CommunityService {
	
	@Autowired
	CommunityRepository commRepo;

	//@Transactional
//	public List<Community> search(String keyword){
//		List<Community> commList = commRepo.findByTitleContaining(keyword);
//		
//		return commList;
//	}
	
}
