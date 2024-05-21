package com.green.jobhunter.controller;

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
import com.green.jobhunter.entity.EnterpriseCommunity;
import com.green.jobhunter.repository.CommunityRepository;
import com.green.jobhunter.repository.EnterpriseCommunityRepository;
import com.green.jobhunter.service.CommunityService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	CommunityRepository communityRepo;
	
	@Autowired
	CommunityService communityService;

	@Autowired
	EnterpriseCommunityRepository enterRepo;

	@RequestMapping("/forumWriteForm")
	public String forumWriteForm(@RequestParam("boardtype") int boardtype, Model model) {

		model.addAttribute("boardtype", boardtype);

		return "board/forumWriteForm";
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

        return "board/openForum";
    }

//	@RequestMapping("/openForum")
//	public String openForum(Model model) {
//
//		List<Community> list = communityRepo.findAll();
//
//		model.addAttribute("list", list);
//
//		return "board/openForum";
//	}

	@RequestMapping("/enterpriseForum")
	public String enterpriseForum(
            @PageableDefault(page = 0, size = 10, sort = "eccode", direction = Sort.Direction.DESC) Pageable pageable,
            Model model) {

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

        return "board/enterpriseForum";
    }

//	@RequestMapping("/enterpriseForum")
//	public String enterpriseForum(Model model) {
//
//		List<EnterpriseCommunity> list = enterRepo.findAll();
//
//		model.addAttribute("list", list);
//
//		return "board/enterpriseForum";
//	}

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
	
	@RequestMapping("/search")
	public String search(@RequestParam("keyword") String keyword,
			@PageableDefault(page = 0, size = 10, sort = "regdate", direction = Sort.Direction.DESC) Pageable pageable,
			Model model,
			@RequestParam("boardtype") int boardtype) {
		
		if(boardtype == 1) {
			
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
			
			return "board/openForum";
		}else if(boardtype == 2) {
			//pageable = PageRequest.of(0, 10, Sort.by("eccode").descending());
			
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
			
			return "board/enterpriseForum";
			
		}
		
		return "board/openForum";
		
	}
	
	
	@RequestMapping("/updateForm")
	public String updateForm(@RequestParam("cmcode") Long cmcode,@RequestParam("boardtype") int boardtype , Model model) {
		
		Community community = communityRepo.findByCmcode(cmcode);
		
		model.addAttribute("community", community);
		model.addAttribute("boardtype", boardtype);
		
		return "board/forumWriteForm";
	}
	
	@RequestMapping("update")
	public String update(Community community,
			EnterpriseCommunity enterpriseCommunity,
			@RequestParam("boardtype") int boardtype) {
		
		
		if(boardtype == 1) {
			communityRepo.save(community);
			
			return "redirect:board/openForum";
			
		}else if(boardtype == 2) {
			enterRepo.save(enterpriseCommunity);
			
			return "redirect:board/enterpriseForum";
		}
		
		return "redirect:forumWriteForm";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("cmcode") Long cmcode) {
		
		communityRepo.deleteByCmcode(cmcode);
		
		return "redirect:openForum";
	}
	
	
	
	

}
