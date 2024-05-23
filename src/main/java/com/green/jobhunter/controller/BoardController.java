package com.green.jobhunter.controller;

import java.io.PrintWriter;
import java.util.List;

import org.hibernate.engine.internal.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.jobhunter.entity.Community;
import com.green.jobhunter.entity.CommunityReply;
import com.green.jobhunter.entity.EnterCommu_reply;
import com.green.jobhunter.entity.EnterpriseCommunity;
import com.green.jobhunter.repository.Commu_replyRepository;
import com.green.jobhunter.repository.CommunityRepository;
import com.green.jobhunter.repository.EnterCommu_replyRepository;
import com.green.jobhunter.repository.EnterpriseCommunityRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpServletResponse response;

	@Autowired
	CommunityRepository communityRepo;

	@Autowired
	Commu_replyRepository communityReplyRepo;
	
	@Autowired
	EnterpriseCommunityRepository enterRepo;
	
	@Autowired
	EnterCommu_replyRepository enterReplyRepo;

	@RequestMapping("/forumWriteForm")
	public String forumWriteForm(@RequestParam("boardtype") int boardtype, Model model) {

		model.addAttribute("boardtype", boardtype);

		return "/board/forumWriteForm";
	}

	@RequestMapping("/openForum")
	public String openForum(
			@PageableDefault(page = 0, size = 10, sort = "cmcode", direction = Sort.Direction.DESC) Pageable pageable,
			Model model
			) {

		Page<Community> page = communityRepo.findAll(pageable);

		// 각 게시글 별 댓글 수 
		List<String> reply_cnt_ = communityRepo.countReplys(pageable);
		model.addAttribute("reply_cnt", reply_cnt_);
			
		if (page.isEmpty()) {
			model.addAttribute("list", null);
			model.addAttribute("totalPages", 0);
			model.addAttribute("totalElements", 0);
			model.addAttribute("currentPage", 0);
			model.addAttribute("pageSize", pageable.getPageSize());
			model.addAttribute("hasNext", false);
			model.addAttribute("hasPrevious", false);
			model.addAttribute("startPage", 0);
			model.addAttribute("endPage", 0);
		}
		else{
			int currentPage = page.getNumber();
			int totalPages = page.getTotalPages();
	
			// 페이지 번호 계산
			int startPage, endPage;
			if (totalPages <= 5) {
				startPage = 0;
				endPage = totalPages - 1;
			} else {
				if (currentPage <= 2) {
					startPage = 0;
					endPage = 4;
				} else if (currentPage >= totalPages - 3) {
					startPage = totalPages - 5;
					endPage = totalPages - 1;
				} else {
					startPage = currentPage - 2;
					endPage = currentPage + 2;
				}
			}
			
	
			model.addAttribute("list", page.getContent());
			model.addAttribute("totalPages", totalPages);
			model.addAttribute("totalElements", page.getTotalElements());
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pageSize", page.getSize());
			model.addAttribute("hasNext", page.hasNext());
			model.addAttribute("hasPrevious", page.hasPrevious());
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
		}

		return "/board/openForum";
	}

	@RequestMapping("/enterpriseForum")
	public String enterpriseForum(
			@PageableDefault(page = 0, size = 10, sort = "eccode", direction = Sort.Direction.DESC) Pageable pageable,
			Model model){

			Page<EnterpriseCommunity> page = enterRepo.findAll(pageable);
			int currentPage = page.getNumber();
			int totalPages = page.getTotalPages();

			// 각 게시글 별 댓글 수 
			List<String> reply_cnt_ = enterRepo.countReplys(pageable);
			model.addAttribute("enterReply_cnt", reply_cnt_);

			if (page.isEmpty()) {
				model.addAttribute("list", null);
				model.addAttribute("totalPages", 0);
				model.addAttribute("totalElements", 0);
				model.addAttribute("currentPage", 0);
				model.addAttribute("pageSize", pageable.getPageSize());
				model.addAttribute("hasNext", false);
				model.addAttribute("hasPrevious", false);
				model.addAttribute("startPage", 0);
				model.addAttribute("endPage", 0);
			}
			else{
				// 페이지 번호 계산
				int startPage, endPage;
				if (totalPages <= 5) {
					startPage = 0;
					endPage = totalPages - 1;
				} else {
					if (currentPage <= 2) {
						startPage = 0;
						endPage = 4;
					} else if (currentPage >= totalPages - 3) {
						startPage = totalPages - 5;
						endPage = totalPages - 1;
					} else {
						startPage = currentPage - 2;
						endPage = currentPage + 2;
					}
				}
				
				model.addAttribute("list", page.getContent());
				model.addAttribute("totalPages", totalPages);
				model.addAttribute("totalElements", page.getTotalElements());
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("pageSize", page.getSize());
				model.addAttribute("hasNext", page.hasNext());
				model.addAttribute("hasPrevious", page.hasPrevious());
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				
			}
			return "/board/enterpriseForum";
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
		return "/board/forumWriteForm";

	}

	@RequestMapping("/forumDetail")
	public String forumDetail(@RequestParam("cmcode") Long cmcode, Model model) {

		Community community = communityRepo.findByCmcode(cmcode);
		List<CommunityReply> replyList = communityReplyRepo.findByCmcode(community);
		
		model.addAttribute("reply",replyList);
		model.addAttribute("community", community);

		return "/board/forumDetail";

	}

	@RequestMapping("/forumDetail2")
	public String forumDetail2(@RequestParam("eccode") Long eccode, Model model) {

		EnterpriseCommunity entcommunity = enterRepo.findByEccode(eccode);
		List<EnterCommu_reply> enterReplyList = enterReplyRepo.findByEccode(entcommunity);
		
		model.addAttribute("reply", enterReplyList);
		model.addAttribute("community", entcommunity);

		return "/board/forumDetail2";
	}

	@RequestMapping("/search")
	public String search(@RequestParam("keyword") String keyword,
			@PageableDefault(page = 0, size = 10, sort = "regdate", direction = Sort.Direction.DESC) Pageable pageable,
			Model model, @RequestParam("boardtype") int boardtype) {

		if (boardtype == 1) {

			Page<Community> searchPage = communityRepo.findByTitleContaining(keyword, pageable);

			// 각 게시글 별 댓글 수 
			List<String> reply_cnt_ = communityRepo.countReplySearch(keyword,pageable);
			model.addAttribute("reply_cnt", reply_cnt_);

			int currentPage = searchPage.getNumber();
			int totalPages = searchPage.getTotalPages();

			// 페이지 번호 계산
			if (searchPage.isEmpty()) {
				model.addAttribute("list", null);
				model.addAttribute("totalPages", 0);
				model.addAttribute("totalElements", 0);
				model.addAttribute("currentPage", 0);
				model.addAttribute("pageSize", pageable.getPageSize());
				model.addAttribute("hasNext", false);
				model.addAttribute("hasPrevious", false);
				model.addAttribute("startPage", 0);
				model.addAttribute("endPage", 0);
			}
			else{
				int startPage, endPage;
				if (totalPages <= 5) {
					startPage = 0;
					endPage = totalPages - 1;
				} else {
					if (currentPage <= 2) {
						startPage = 0;
						endPage = 4;
					} else if (currentPage >= totalPages - 3) {
						startPage = totalPages - 5;
						endPage = totalPages - 1;
					} else {
						startPage = currentPage - 2;
						endPage = currentPage + 2;
					}
				}

				model.addAttribute("searchList", searchPage.getContent());
				model.addAttribute("totalPages", totalPages);
				model.addAttribute("totalElements", searchPage.getTotalElements());
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("pageSize", searchPage.getSize());
				model.addAttribute("hasNext", searchPage.hasNext());
				model.addAttribute("hasPrevious", searchPage.hasPrevious());
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("keyword", keyword);
				model.addAttribute("searchPage", searchPage);
			}
			return "/board/openForum";
		} else if (boardtype == 2) {
			// pageable = PageRequest.of(0, 10, Sort.by("eccode").descending());

			Page<EnterpriseCommunity> searchPage = enterRepo.findByTitleContaining(keyword, pageable);
			
			// 각 게시글 별 댓글 수 
			List<String> reply_cnt_ = enterRepo.countReplySearch(keyword, pageable);
			model.addAttribute("enterReply_cnt", reply_cnt_);

			int currentPage = searchPage.getNumber();
			int totalPages = searchPage.getTotalPages();

			if (searchPage.isEmpty()) {
				model.addAttribute("list", null);
				model.addAttribute("totalPages", 0);
				model.addAttribute("totalElements", 0);
				model.addAttribute("currentPage", 0);
				model.addAttribute("pageSize", pageable.getPageSize());
				model.addAttribute("hasNext", false);
				model.addAttribute("hasPrevious", false);
				model.addAttribute("startPage", 0);
				model.addAttribute("endPage", 0);
			}
			else{
				// 페이지 번호 계산
				int startPage, endPage;
				if (totalPages <= 5) {
					startPage = 0;
					endPage = totalPages - 1;
				} else {
					if (currentPage <= 2) {
						startPage = 0;
						endPage = 4;
					} else if (currentPage >= totalPages - 3) {
						startPage = totalPages - 5;
						endPage = totalPages - 1;
					} else {
						startPage = currentPage - 2;
						endPage = currentPage + 2;
					}
				}

				model.addAttribute("searchList", searchPage.getContent());
				model.addAttribute("totalPages", totalPages);
				model.addAttribute("totalElements", searchPage.getTotalElements());
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("pageSize", searchPage.getSize());
				model.addAttribute("hasNext", searchPage.hasNext());
				model.addAttribute("hasPrevious", searchPage.hasPrevious());
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("keyword", keyword);
				model.addAttribute("searchPage", searchPage);
			}
			return "/board/enterpriseForum";

		}

		return "/board/openForum";

	}

	@RequestMapping("/updateForm")
	public String updateForm(@RequestParam("cmcode") Long cmcode, @RequestParam("boardtype") int boardtype,
			Model model) {

		Community community = communityRepo.findByCmcode(cmcode);

		model.addAttribute("community", community);
		model.addAttribute("boardtype", boardtype);

		return "/board/forumWriteForm";
	}

	@RequestMapping("/updateForm2")
	public String updateForm2(@RequestParam("eccode") Long eccode, @RequestParam("boardtype") int boardtype,
			Model model) {

		EnterpriseCommunity entCommunity = enterRepo.findByEccode(eccode);

		model.addAttribute("entCommunity", entCommunity);
		model.addAttribute("boardtype", boardtype);

		return "/board/forumWriteForm";
	}

	@RequestMapping("update")
	public String update(@RequestParam("cmcode") Long cmcode,
			@RequestParam("eccode") Long eccode,
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			@RequestParam("boardtype") int boardtype) {

		if(boardtype == 1) {
			Community community = communityRepo.findByCmcode(cmcode);
			community.setTitle(title);
			community.setContent(content);
			communityRepo.save(community);
			
			return "redirect:openForum";
		}else {
			EnterpriseCommunity entCommunity = enterRepo.findByEccode(eccode);
			entCommunity.setTitle(title);
			entCommunity.setContent(content);
			enterRepo.save(entCommunity);
			
			return "redirect:enterpriseForum";
		}


	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("cmcode") Long cmcode) {

		communityRepo.deleteByCmcode(cmcode);

		return "redirect:openForum";
	}
	
	@RequestMapping("/communityReply")
	public String communityReply(CommunityReply communityReply, @RequestParam("cmcode") Long cmcode) {
		
		communityReplyRepo.save(communityReply);
		
		return "redirect:/board/forumDetail?cmcode="+cmcode;
	}
	
	@RequestMapping("/enterCommuReply")
	public String enterCommuReply(EnterCommu_reply enterCommuReply, @RequestParam("eccode") Long eccode) {
		
		enterReplyRepo.save(enterCommuReply);
		
		return "redirect:/board/forumDetail2?eccode="+eccode;
	}

}
