package com.green.jobhunter.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.jobhunter.entity.Career;
import com.green.jobhunter.entity.Certificate;
import com.green.jobhunter.entity.CoverLetter;
import com.green.jobhunter.entity.DesiredArea;
import com.green.jobhunter.entity.DesiredIndustry;
import com.green.jobhunter.entity.Hunter;
import com.green.jobhunter.entity.MainCategory;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Resume;
import com.green.jobhunter.entity.ResumeSkill;
import com.green.jobhunter.entity.SubCategory;
import com.green.jobhunter.repository.CareerRepository;
import com.green.jobhunter.repository.CertificateRepository;
import com.green.jobhunter.repository.CoverLetterRepository;
import com.green.jobhunter.repository.DesiredAreaRepository;
import com.green.jobhunter.repository.DesiredIndustryRepository;
import com.green.jobhunter.repository.HunterRepository;
import com.green.jobhunter.repository.MainCategoryRepository;
import com.green.jobhunter.repository.MemberRepository;
import com.green.jobhunter.repository.ResumeRepository;
import com.green.jobhunter.repository.ResumeSkillRepository;
import com.green.jobhunter.repository.SubCategoryRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/hunter")
public class HunterController {
	
	@Autowired
	HunterRepository hunterRepository;
	@Autowired
	ResumeRepository resumeRepository;
	@Autowired
	DesiredAreaRepository desiredAreaRepository;
	@Autowired
	DesiredIndustryRepository desiredIndustryRepository;
	@Autowired
	CertificateRepository certificateRepository;
	@Autowired
	CareerRepository careerRepository;
	@Autowired
	CoverLetterRepository coverLetterRepository;
	@Autowired
	ResumeSkillRepository resumeSkillRepository;
	@Autowired
	MemberRepository memberRepo;
	@Autowired
	MainCategoryRepository mainCategoryRepository;
	@Autowired
	SubCategoryRepository subCategoryRepository;
	
	
    @RequestMapping("/")
    public String root(){
        return "/home";  
    }

    @RequestMapping("/hunterpage")
    public String goHunterPage(){
        return "/hunter/hunterPage";  
    }
    
    @RequestMapping("/resumeWriteForm")
    public String writeResume(Model model) {
    	//DesiredIndustry desiredIndustry;
    	List<MainCategory> mainList = mainCategoryRepository.findAll();
    	List<SubCategory> middleList = subCategoryRepository.findAll();
    	
    	System.out.println("Main List: " + mainList);  // 로그로 데이터 확인
    	System.out.println("Middle List: " + middleList);  // 로그로 데이터 확인
    	
    	model.addAttribute("main", mainList);
    	model.addAttribute("middle", middleList);
    	
    	return "/hunter/resumeWriteForm";
    }
    
    @RequestMapping("/resumeWrite")
    public String addResume(HttpServletRequest req, Model model) {
    	Hunter hunter = new Hunter();
    	Resume resume = new Resume();
    	DesiredArea dArea = new DesiredArea();
    	DesiredIndustry dIndustry = new DesiredIndustry();
    	Certificate certificate = new Certificate();
    	Career career = new Career();
    	CoverLetter coverLetter = new CoverLetter();
    	ResumeSkill resumeSkill = new ResumeSkill();
    	
    	
    	//hunter 정보
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

    	resume.setTitle(req.getParameter("title"));
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
    	dIndustry.setMainCategory(req.getParameter("middleCategory"));
    	dIndustry.setMiddleCategory(req.getParameter("middleCategory"));
    	
    	//certificate 정보
    	certificate.setPublisher(req.getParameter("certificate"));
       	LocalDate issuedate = LocalDate.parse(req.getParameter("certificate"));
    	certificate.setIssuedate(issuedate);
    	
    	certificateRepository.save(certificate);
    	
    	//career 정보
    	career.setCompanyname(req.getParameter("companyname"));
    	LocalDate cardate = LocalDate.parse(req.getParameter("cardate"));
    	career.setCardate(cardate);
    	LocalDate enddate = LocalDate.parse(req.getParameter("enddate"));
    	career.setEnddate(enddate);
    	career.setIndustry(req.getParameter("industry"));
    	career.setPosition(req.getParameter("position"));
    	career.setJob(req.getParameter("job"));
    	career.setWork(req.getParameter("work"));
    	career.setSalary(req.getParameter("salary"));
    	
    	careerRepository.save(career);
    	
    	//coverLetter 정보
    	coverLetter.setTitle(req.getParameter("title"));
    	coverLetter.setContent(req.getParameter("content"));
    	
    	coverLetterRepository.save(coverLetter);
    	
    	//resumeSkill 정보
    	resumeSkill.setStack(req.getParameter("stack"));
    	
    	resumeSkillRepository.save(resumeSkill);
    	
    	
    	return "redirect:/hunter/resumeList";
    
    }
     
    @RequestMapping("/resumeList")
    public String goResumeList(HttpServletRequest req) {
    	HttpSession session = req.getSession();
    	String logged = (String)session.getAttribute("logged");
    	Long resumecode = Long.parseLong(req.getParameter("resumecode"));
    	Member member = memberRepo.findByMemberid(logged);
    	resumeRepository.findTitle(member);
    	
    	return "/hunter/resumeList";
    }
    
    
    
    
}
