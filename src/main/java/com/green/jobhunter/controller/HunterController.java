package com.green.jobhunter.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.jobhunter.entity.DesiredArea;
import com.green.jobhunter.entity.DesiredIndustry;
import com.green.jobhunter.entity.Hunter;
import com.green.jobhunter.entity.Resume;
import com.green.jobhunter.repository.DesiredAreaRepository;
import com.green.jobhunter.repository.DesiredIndustryRepository;
import com.green.jobhunter.repository.HunterRepository;
import com.green.jobhunter.repository.ResumeRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/hunter")
public class HunterController {
	
	@Autowired
	HunterRepository hunterRepository;
	ResumeRepository resumeRepository;
	DesiredAreaRepository desiredAreaRepository;
	DesiredIndustryRepository desiredIndustryRepository;
	HttpSession session;
	
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
    	Hunter hunter = new Hunter();
    	Resume resume = new Resume();
    	DesiredArea dArea = new DesiredArea();
    	DesiredIndustry dIndustry = new DesiredIndustry();
    	
    	//hunter 정보
    	hunter.setTitle(req.getParameter("title"));
    	hunter.setUsername("username");
    	String birth_ =req.getParameter("birth");
    	LocalDate birth = LocalDate.parse(birth_);
    	hunter.setBirth(birth);
    	hunter.setAge(Integer.parseInt("age"));
    	hunter.setTel(req.getParameter("tel"));
    	hunter.setTel2(req.getParameter("tel2"));
    	hunter.setAddress(req.getParameter("address"));
    	hunter.setEmail(req.getParameter("email"));
    	String gender_ = req.getParameter("gender");
    	hunter.setGender(gender_.charAt(1));
    	String military_= req.getParameter("military");
    	hunter.setGender(military_.charAt(1));
    	String repotnum_ = req.getParameter("reportnum");
    	hunter.setReportnum(Integer.parseInt(repotnum_));
    	hunter.setNewOrExp(req.getParameter("newOrExp"));
    	
    	hunterRepository.save(hunter);
    	
    	//resume 정보
    	String pay_ = req.getParameter("pay");
    	resume.setDesirepay(Integer.parseInt(pay_));
    	resume.setEduname("eduname");
    	resume.setEdutype("edutype");
    	resume.setEdumajor("edumajor");
    	resume.setEdustate("edustate");
    	LocalDate graduatedate_ = LocalDate.parse("graduatedate");
    	resume.setGraduatedate(graduatedate_);
    	resume.setEmploymenttype("employmenttype");
    	String modifydate_ = req.getParameter("modifydate_");
    	LocalDate modifydate = LocalDate.parse(modifydate_);
    	resume.setModifydate(modifydate);
    	resume.setPhotourl(req.getParameter("photourl"));
    	String desirepay_ = req.getParameter("desiredpay");
    	int desirepay = Integer.parseInt(desirepay_);
    	resume.setDesirepay(desirepay);
    	String publictype_ = req.getParameter("publictype");
    	resume.setPublictype(publictype_.charAt(1));
    	
    	resumeRepository.save(resume);
    	
    	//desiredArea 정보
    	dArea.setArea1(req.getParameter("area1"));
    	dArea.setArea1(req.getParameter("area2"));
    	
    	desiredAreaRepository.save(dArea);
    	
    	//desiredIndustry 정보
    	dIndustry.setIndustry1(req.getParameter("industry1"));
    	dIndustry.setIndustry2(req.getParameter("industry2"));
    	//dIndustry.setIndustry3(req.getParameter("industry3"));
    	
    	
    	
    	
    	
    	
    	return "";
    }
    
    
    
    
    
    
    
    
}
