package com.green.jobhunter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.jobhunter.entity.Enterprise;
import com.green.jobhunter.repository.EnterpriseRepository;
import com.green.jobhunter.repository.MemberRepository;

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
    public String root3(){
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
    //인재정보페이지
    @RequestMapping("/hunterList")
    public String root5(){
        return "/enter/hunterList";  
    }
    
    //기업정보페이지 수정하기
    @RequestMapping("/enterpriseUpdate")
    public void enterpriseUpdate() {
    	
    }

    
}
