package com.green.jobhunter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.jobhunter.entity.Member;
import com.green.jobhunter.repository.MemberRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	@Autowired 
	MemberRepository memberrepository;
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpServletResponse response;

	
    @RequestMapping("/")
    public String root(){
        return "main/postList";  
    }
    @RequestMapping("/registForm")
    public String regForm(){
        return "main/registForm";  
    }
    @RequestMapping("/loginForm")
    public String loginForm(){
        return "main/loginForm";  
    }
   
    
    
    @RequestMapping("/login")
    public String login(@RequestParam("id") String id,@RequestParam("pw") String pw, Model model){
    	Member member = memberrepository.findByMem(id,pw);
		System.out.println("==========================member : " +member);
		if(member==null) {
			return "main/loginForm";
		}
		if (member != null & member.getRole()=='1') {
			HttpSession session = request.getSession();
			// model.addAttribute("msg", "로그인에 성공하였습니다");
			// model.addAttribute("msg2", "메인으로");
			// model.addAttribute("url", "main");
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			return "enter/enterprisePage";
		} else if(member != null & member.getRole()=='2') {
			HttpSession session = request.getSession();
			
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			return "main/postList";
		}
		
		
		return "";
    }
    
    
}
