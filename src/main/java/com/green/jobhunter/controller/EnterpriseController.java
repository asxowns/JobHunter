package com.green.jobhunter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.jobhunter.entity.Enterprise;
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
    //채용공고관리페이지
    @RequestMapping("/enterprisePostList")
    public String root3(Model model, HttpServletRequest request){
    	HttpSession session = request.getSession();
    	String id = (String)session.getAttribute("id");
    	Posting posting = postingRepository.findByEid(id);
    	System.out.println(posting);
    	model.addAttribute("posting", posting);
    	return "/enter/enterprisePostList";  
    }
    //기업정보페이지
    @RequestMapping("/enterpriseInfoWriteForm")
    public String root4(Model model, HttpServletRequest request){
    	
    	HttpSession session = request.getSession();
    	session.setAttribute("id", "aaa");
    	String id = (String)session.getAttribute("id");
    	Enterprise enterprise = enterpriseRepository.findByEid(id);
    	System.out.println(id+"===================");
    	System.out.println(enterprise+"===================");
    	System.out.println(enterprise.getEid()+"===================");
    	model.addAttribute("enterprise", enterprise);
    	
    	return "/enter/enterpriseInfoWriteForm";  
    }
    
    //기업정보페이지 수정하기
    @RequestMapping("enterpriseUpdate")
    public String enterpriseUpdate(HttpServletRequest request, Enterprise enterprise) {
    	enterpriseRepository.save(enterprise);
    	return "redirect:/enter/enterpriseInfoWriteForm";
    }
    
    //인재정보페이지
    @RequestMapping("/hunterList")
    public String root5(){
        return "/enter/hunterList";  
    }
    
    //해당공고별 지원자 관리페이지 
    @RequestMapping("/hunterPerPostList")
    public String root6() {
    	return "/enter/hunterPerPostList";
    }
    
    //해당공고별 지원자 관리페이지 
    @RequestMapping("/enterprisePostWriteForm")
    public String root7() {
    	return "/enter/enterprisePostWriteForm";
    }
    
    //해당공고 수정 폼
    @RequestMapping("enterprisePostUpdate")
    public String enterprisePostWriteForm() {
    	return "/enter/enterprisePostWriteForm";
    }
    //채용공고 삭제
    /*@RequestMapping("/enterprisePostDelete")
	public String delete(@RequestParam("eid") String eid) {
		memberRepository.deleteById(eid);
		return "redirect:/enter/enterprisePostWriteForm";
	}*/
   

    
}
