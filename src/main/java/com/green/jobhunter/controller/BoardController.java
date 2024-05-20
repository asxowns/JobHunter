package com.green.jobhunter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.jobhunter.entity.Community;
import com.green.jobhunter.entity.EnterpriseCommunity;
import com.green.jobhunter.repository.CommunityRepository;
import com.green.jobhunter.repository.EnterpriseCommunityRepository;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	CommunityRepository communityRepo;

	@Autowired
	EnterpriseCommunityRepository enterRepo;

	@RequestMapping("/forumWriteForm")
	public String forumWriteForm(@RequestParam("boardtype") int boardtype, Model model) {

		model.addAttribute("boardtype", boardtype);

		return "board/forumWriteForm";
	}

	@RequestMapping("/openForum")
	public String openForum(Model model) {

		List<Community> list = communityRepo.findAll();

		model.addAttribute("list", list);

		return "board/openForum";
	}

	@RequestMapping("/enterpriseForum")
	public String enterpriseForum(Model model) {

		List<EnterpriseCommunity> list = enterRepo.findAll();

		model.addAttribute("list", list);

		return "board/enterpriseForum";
	}

	@RequestMapping("/write")
	public String openWrite(Community community, EnterpriseCommunity entcommunity,
			@RequestParam("boardtype") int boardtype) {

		if (boardtype == 1) {
			communityRepo.save(community);
			return "redirect:openForum";
		} else if (boardtype == 2) {
			enterRepo.save(entcommunity);
			return "redirect:enterpriseForum";
		}
		return "board/forumWriteForm";

	}

	@RequestMapping("/forumDetail")
	public String forumDetail(@RequestParam("cmcode") Long cmcode, Model model) {

			Community community = communityRepo.findByCmcode(cmcode);

			model.addAttribute("community", community);

			return "board/forumDetail";
			


	}
	
	@RequestMapping("/forumDetail2")
	public String forumDetail2(@RequestParam("eccode") Long eccode, Model model) {
		
		EnterpriseCommunity entcommunity = enterRepo.findByEccode(eccode);

		model.addAttribute("community", entcommunity);
		
		return "board/forumDetail2";
	}

}
