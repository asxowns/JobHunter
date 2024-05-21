package com.green.jobhunter.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.jobhunter.entity.Enterprise;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Posting;
import com.green.jobhunter.repository.EnterpriseRepository;
import com.green.jobhunter.repository.MemberRepository;
import com.green.jobhunter.repository.PostingRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/enter")
public class EnterpriseController {
	@Autowired
	EnterpriseRepository enterpriseRepository;
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	PostingRepository postingRepository;
	@Autowired
	HttpSession session;  
	
	@RequestMapping("/")
    public String root(){
        return "home";  
    }
	
	//기업마이페이지 
    @RequestMapping("/enterprisePage")
    public String root2(){
    	
        return "/enter/enterprisePage";  
    }
    //기업정보페이지
    @RequestMapping("/enterpriseInfoWriteForm")
    public String root4(Model model, HttpServletRequest request){
    	
    	HttpSession session = request.getSession();
    	String id = (String)session.getAttribute("logged");
    	//String id = "aaa";
    	Enterprise enterprises = enterpriseRepository.findByEid(id);
    	
    	System.out.println(id+"===================");
    	System.out.println(enterprises+"===================");
    	model.addAttribute("enterprise", enterprises);
    	
    	return "/enter/enterpriseInfoWriteForm";  
    }
    //기업정보페이지 수정하기
    @RequestMapping("/enterpriseUpdate")
    public String enterpriseUpdate(Model model, @RequestParam("entercode") Long entercode,
    		@RequestParam("password") String password, @RequestParam("companyname") String companyname, 
    		@RequestParam("corporatetype") String corporatetype, @RequestParam("managertel") String managertel, 
    		@RequestParam("manageremail") String manageremail, @RequestParam("businessnumber") String businessnumber) {
    	
    	Enterprise enter = enterpriseRepository.findByEntercode(entercode);
    	enter.setCompanyname(companyname);
    	enter.setCorporatetype(corporatetype);
    	enter.setManagertel(managertel);
    	enter.setManageremail(manageremail);
    	enter.setBusinessnumber(businessnumber);
    	
    	Member member = memberRepository.findByMemberid("logged");
    	member.setPassword(password);
    	
    	memberRepository.save(member);
    	enterpriseRepository.save(enter);
        return "redirect:/enter/enterpriseInfoWriteForm";
    }
    
    //채용공고관리페이지
    @RequestMapping("/enterprisePostList")
    public String root3(Model model, HttpServletRequest request){
    	HttpSession session = request.getSession();
    	String id = (String)session.getAttribute("logged");
    	//id = "aaa";
    	List <Posting> posting = postingRepository.findByEid(id);
    	System.out.println(posting);
    	model.addAttribute("posting", posting);
    	
    	return "/enter/enterprisePostList";  
    }
    
    //해당공고별 지원자 관리페이지 
    @RequestMapping("/hunterPerPostList")
    public String root6(@RequestParam("postcode") Long postcode, Model model) {
    	Posting posting = postingRepository.findByPostcode(postcode);
    	model.addAttribute("posting", posting);
    	return "/enter/hunterPerPostList";
    }
    //채용공고 등록 폼
    @RequestMapping("/enterprisePostWriteForm")
    public String root7() {
    	return "/enter/enterprisePostWriteForm";
    }
    
    //채용공고 등록  
    @RequestMapping("/enterprisePostWrite")
    public String enterpriseWrite(HttpServletRequest request, Model model) {
    	// session = request.getSession();
    	// String eid = (String)request.getAttribute("logged");
    	
    	// Posting posting = postingRepository.findByEid(eid);
    	// posting.setTitle(request.getParameter("title"));
    	
    	// int headcount_ = Integer.parseInt(request.getParameter("headcount"));
    	// posting.setHeadcount(headcount_);
    	// posting.setEdutype(request.getParameter("edutype"));
    	// posting.setCareer(request.getParameter("career"));
    	// posting.setEmploymenttype(request.getParameter("employmenttype"));
    	
    	// int pay_ = Integer.parseInt(request.getParameter("pay"));
    	// posting.setPay(pay_);
    	// posting.setArea(request.getParameter("area"));
    	// posting.setJob(request.getParameter("job"));
    	
    	// String deadlineString = request.getParameter("deadline");
        // LocalDateTime deadline = LocalDateTime.parse(deadlineString.replace(" ", "T")); // 공백을 'T'로 대체하여 LocalDateTime으로 변환
        // posting.setDeadline(deadline);
    	
    	// posting.setManagertel(request.getParameter("managertel"));
    	// posting.setMainurl(request.getParameter("mainurl"));
    	// posting.setMaincontent(request.getParameter("maincontent"));
    	
    	// postingRepository.save(posting);
    	// System.out.println(posting+"++++++++");
    	
    	return "redirect:/enter/enterprisePostList";
    }
    
    //해당공고 수정 폼
    @RequestMapping("/enterprisePostUpdateForm")
    public String enterprisePostWriteForm(Model model, HttpServletRequest request) {
    	return "/enter/enterprisePostUpdateForm";
    }
    //해당공고 수정 기능 
    @RequestMapping("/enterprisePostUpdate")
    public String enterprisePostUpdate(){
    	
    	return "/enter/enterprisePostList";
    }
    
    //채용공고 삭제
    @RequestMapping("/enterprisePostDelete")
	public String delete(@RequestParam("postcode") Long postcode) {
		postingRepository.deleteBypostcode(postcode);
		return "redirect:/enter/enterprisePostList";
	}
   
    //인재정보페이지
    @RequestMapping("/hunterList")
    public String root5(){
        return "/enter/hunterList";  
    }
    
}
