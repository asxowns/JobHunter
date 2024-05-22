package com.green.jobhunter.controller;

import java.io.PrintWriter;
import java.util.List;

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
import com.green.jobhunter.entity.EnterpriseCommunity;
import com.green.jobhunter.repository.Commu_replyRepository;
import com.green.jobhunter.repository.CommunityRepository;
import com.green.jobhunter.repository.EnterpriseCommunityRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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

	@RequestMapping("/forumWriteForm")
	public String forumWriteForm(@RequestParam("boardtype") int boardtype, Model model) {

		model.addAttribute("boardtype", boardtype);

		return "/board/forumWriteForm";
	}

	@RequestMapping("/openForum")
	public String openForum(
			@PageableDefault(page = 0, size = 10, sort = "cmcode", direction = Sort.Direction.DESC) Pageable pageable,
			Model model) {

		Page<Community> page = communityRepo.findAll(pageable);
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

		return "/board/openForum";
	}

	@RequestMapping("/enterpriseForum")
	public String enterpriseForum(
			@PageableDefault(page = 0, size = 10, sort = "eccode", direction = Sort.Direction.DESC) Pageable pageable,
			Model model, @RequestParam("boardtype") int boardtype) throws Exception {

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		Character role = (Character) session.getAttribute("role");

			Page<EnterpriseCommunity> page = enterRepo.findAll(pageable);
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
		Community commu = communityRepo.findByCmcode(cmcode);
		List<CommunityReply> reply = communityReplyRepo.findByCmcode(commu);
		model.addAttribute("reply",reply);
		model.addAttribute("community", community);

		return "/board/forumDetail";

	}

	@RequestMapping("/forumDetail2")
	public String forumDetail2(@RequestParam("eccode") Long eccode, Model model) {

		EnterpriseCommunity entcommunity = enterRepo.findByEccode(eccode);

		model.addAttribute("community", entcommunity);

		return "/board/forumDetail2";
	}

	@RequestMapping("/search")
	public String search(@RequestParam("keyword") String keyword,
			@PageableDefault(page = 0, size = 10, sort = "regdate", direction = Sort.Direction.DESC) Pageable pageable,
			Model model, @RequestParam("boardtype") int boardtype) {

		if (boardtype == 1) {

			Page<Community> searchPage = communityRepo.findByTitleContaining(keyword, pageable);

			int currentPage = searchPage.getNumber();
			int totalPages = searchPage.getTotalPages();

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

			return "/board/openForum";
		} else if (boardtype == 2) {
			// pageable = PageRequest.of(0, 10, Sort.by("eccode").descending());

			Page<EnterpriseCommunity> searchPage = enterRepo.findByTitleContaining(keyword, pageable);

			int currentPage = searchPage.getNumber();
			int totalPages = searchPage.getTotalPages();

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
	public String update(@RequestParam("cmcode") Long cmcode, @RequestParam("title") String title,
			@RequestParam("content") String content, @RequestParam("boardtype") int boardtype) {

		Community community = communityRepo.findByCmcode(cmcode);
		community.setTitle(title);
		community.setContent(content);
		communityRepo.save(community);

		return "redirect:openForum";

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

}
