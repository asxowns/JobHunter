package com.green.jobhunter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.jobhunter.entity.Resume;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/hunter")
public class HunterController {
    @RequestMapping("/")
    public String root(){
        return "/home";  
    }

    @RequestMapping("/hunterpage")
    public String goHunterPage(){
        return "/hunter/hunterPage";  
    }
    
    @RequestMapping("/resumeWriteForm")
    public String writeResume() {
    	
    	return "/hunter/resumeWriteForm";
    }
    
    @RequestMapping("/resumeWrite")
    public String addResume(HttpServletRequest req, Model model) {
    	Resume resume = new Resume();
    	resume.setTitle(req.getParameter("title"));
    	String pay_ = req.getParameter("pay");
    	resume.setDesire_pay(Integer.parseInt(pay_));
    	
    	
    	
    	return "";
    }
    
    
    
    
    
    
    
    
}
