package com.green.jobhunter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.jobhunter.dto.CareerDto;
import com.green.jobhunter.dto.CertificateDto;
import com.green.jobhunter.dto.CoverLetterDto;
import com.green.jobhunter.dto.DesiredAreaDto;
import com.green.jobhunter.dto.DesiredIndustryDto;
import com.green.jobhunter.dto.HunterDto;
import com.green.jobhunter.dto.MemberDto;
import com.green.jobhunter.dto.ResumeDto;
import com.green.jobhunter.dto.ResumeSkillDto;
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
	MemberRepository memberRepository;
	@Autowired
	MainCategoryRepository mainCategoryRepository;
	@Autowired
	SubCategoryRepository subCategoryRepository;

	@RequestMapping("/")
	public String goHunterPage() {
		return "/hunter/hunterPage";
	}

	// 이력서등록
	@RequestMapping("/resumeWriteForm")
	public String writeResume(Model model) {
		// DesiredIndustry desiredIndustry;
		// List<MainCategory> mainList = mainCategoryRepository.findMainCategory();
		// List<SubCategory> subList = subCategoryRepository.findSubCategory();
		List<MainCategory> mainList = mainCategoryRepository.findAll();
		List<String> subList = subCategoryRepository.findSubCategory();

		// System.out.println("Main List: " + mainList); // 로그로 데이터 확인
		// System.out.println("Middle List: " + subList); // 로그로 데이터 확인

		model.addAttribute("mainList", mainList);
		model.addAttribute("subList", subList);
		
		return "/hunter/resumeWriteForm";
	}

	// 이력서수정
	@RequestMapping("/resumeUpdateForm")
	public String updateResume(Hunter hunter, Resume resume, DesiredArea da, DesiredIndustry di, 
			Career c, CoverLetter cl, ResumeSkill rs, Certificate ctf,  Model model) {
		List<MainCategory> mainList = mainCategoryRepository.findAll();
		List<String> subList = subCategoryRepository.findSubCategory();
		
		model.addAttribute("mainList", mainList);
		model.addAttribute("subList", subList);
		
		model.addAttribute("hunter", hunter);
		model.addAttribute("resume", resume);
		model.addAttribute("da", da);
		model.addAttribute("di", di);
		model.addAttribute("c", c);
		model.addAttribute("cl", cl);
		model.addAttribute("rs", rs);
		model.addAttribute("ctf", ctf);
		
		
		return "/hunter/resumeWrite";
	}
	
	
	
	
	@RequestMapping("/resumeWrite")
	public String addResume(HunterDto h, ResumeDto r, DesiredAreaDto da, DesiredIndustryDto di, 
			CareerDto c, CoverLetterDto cl, ResumeSkillDto rs, CertificateDto ctf, Model model) {

		// hunter 정보
		Hunter hunter = new Hunter();
		hunter.setUsername(h.getUsername());
		hunter.setBirth(h.getBirth());
		hunter.setTel(h.getTel());
		hunter.setTel2(h.getTel2());
		hunter.setAddress(h.getAddress());
		hunter.setEmail(h.getEmail());
		hunter.setGender(h.getGender());
		hunter.setMilitary(h.getMilitary());
		hunter.setReportnum(h.getReportnum());
		hunter.setNewOrExp(h.getNewOrExp());

		// resume 정보
		Resume resume = new Resume();
		resume.setTitle(r.getTitle());
		resume.setEduname(r.getEduname());
		resume.setEdutype(r.getEdutype());
		resume.setEdumajor(r.getEdumajor());
		resume.setEdustate(r.getEdustate());
		resume.setGraduatedate(r.getGraduatedate());
		resume.setEmploymenttype(r.getEmploymenttype());
		resume.setModifydate(r.getModifydate());
		resume.setPhotourl(r.getPhotourl());
		resume.setDesiredpay(r.getDesiredpay());
		resume.setPublictype(r.getPublictype());
		
		// desiredArea 정보
		DesiredArea dArea = new DesiredArea();
		dArea.setResumecode(resume);
		dArea.setArea1(da.getArea1());
		dArea.setArea2(da.getArea2());
		
		// desiredIndustry 정보
		DesiredIndustry dIndustry = new DesiredIndustry();
		dIndustry.setResumecode(resume);
		dIndustry.setMainCategory(di.getMainCategory());
		dIndustry.setMiddleCategory(di.getMiddleCategory());
		
		// career 정보
		Career career = new Career();
		career.setResumecode(resume);
		career.setCompanyname(c.getCompanyname());
		career.setCardate(c.getCardate());
		career.setEnddate(c.getEnddate());
		career.setIndustry(c.getIndustry());
		career.setPosition(c.getPosition());
		career.setJob(c.getJob());
		career.setWork(c.getWork());
		career.setSalary(c.getSalary());
		
		// resumeSkill 정보
		ResumeSkill resumeSkill = new ResumeSkill();
		resumeSkill.setResumecode(resume);
		resumeSkill.setStack(rs.getStack());
		
		// coverLetter 정보
		CoverLetter coverLetter = new CoverLetter();
		coverLetter.setResumecode(resume);
		coverLetter.setGrowth(cl.getGrowth());
		coverLetter.setMotive(cl.getMotive());
		coverLetter.setProsAndCons(cl.getProsAndCons());
		
		// certificate 정보
		Certificate cer = new Certificate();
		cer.setResumecode(resume);
		cer.setPublisher(ctf.getPublisher());
		cer.setIssuedate(ctf.getIssuedate());
		
		
		hunterRepository.save(hunter);
		resumeRepository.save(resume);
		desiredAreaRepository.save(dArea);
		desiredIndustryRepository.save(dIndustry);
		certificateRepository.save(cer);
		careerRepository.save(career);
		coverLetterRepository.save(coverLetter);
		resumeSkillRepository.save(resumeSkill);
		//memberRepository.save();
		
		return "redirect:/hunter/resumeList";
	}


	@RequestMapping("/resumeList")
	public String goResumeList(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		//String logged = (String) session.getAttribute("logged");
		
		// Long resumecode = Long.parseLong(req.getParameter("resumecode"));
		// Member member = memberRepository.findByMemberid(logged);
		// String title = resumeRepository.findTitle(member);
		
		
		//if (!logged.isEmpty()) {
			List<Resume> resume = resumeRepository.findAll();
			model.addAttribute("resume", resume);
		//}

		return "/hunter/resumeList";
	}

	@RequestMapping("/getSubList")
	@ResponseBody
	public List<String> getSubList(@RequestParam("mccode") String mccode) {
		Long mccodeLong = Long.parseLong(mccode); // String을 Long으로 변환
		System.out.println("mccodeLong: " + mccodeLong);
		List<String> subList = null;
		if (mccode != null) {
			subList = subCategoryRepository.findSubCategoryBymccode(mccodeLong);
			System.out.println(subList);

		}
		return subList;
	}

	@RequestMapping("/resumeManagement")
	public String resumeManagement() {

		return "/hunter/resumeManagement";
	}

	@RequestMapping("/jobApplication")
	public String jobApplication() {

		return "/hunter/jobApplication";
	}

	@RequestMapping("/subscribeList")
	public String subscribeList() {

		return "/hunter/subscribeList";
	}

	@RequestMapping("/positionList")
	public String positionList() {

		return "/hunter/positionList";
	}

	@RequestMapping("/favorList")
	public String favorList() {

		return "/hunter/favorList";
	}

	@RequestMapping("/informList")
	public String informList() {

		return "/hunter/informList";
	}
	
	@RequestMapping("/hunterForm")
	public String hunterForm(HttpServletRequest req, MemberDto m, HunterDto h, Model model) {
		HttpSession session = req.getSession();
		String logged_id =(String) session.getAttribute("logged");
		Member member = memberRepository.findByMemId(logged_id);
		Hunter hunter = hunterRepository.findByHid(member);
		model.addAttribute("hunter",hunter);
		model.addAttribute("meme",member);
		return "/hunter/hunterForm";
	}
	
	@RequestMapping("/saveHunterForm")
	public String saveHunterForm(HunterDto h, Member m) {
		Hunter hunter = new Hunter();
		Member member = new Member();
		member.setPassword(m.getPassword());
		hunter.setHid(m);
		hunter.setUsername(h.getUsername());
		hunter.setBirth(h.getBirth());
		hunter.setAddress(h.getAddress());
		hunter.setEmail(h.getEmail());
		hunter.setTel(h.getTel());
		hunter.setTel2(h.getTel2());
		
		hunterRepository.save(hunter);
		memberRepository.save(member);
		
		return "redirect:/hunter/hunterPage";
	}
	
	

}