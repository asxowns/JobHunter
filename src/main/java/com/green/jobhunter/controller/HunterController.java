package com.green.jobhunter.controller;

import java.time.LocalDate;
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
import com.green.jobhunter.entity.Enterprise;
import com.green.jobhunter.entity.Hunter;
import com.green.jobhunter.entity.MainCategory;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Offer;
import com.green.jobhunter.entity.Posting;
import com.green.jobhunter.entity.Resume;
import com.green.jobhunter.entity.ResumeSkill;
import com.green.jobhunter.entity.SubCategory;
import com.green.jobhunter.repository.ApplicationRepository;
import com.green.jobhunter.repository.CareerRepository;
import com.green.jobhunter.repository.CertificateRepository;
import com.green.jobhunter.repository.CoverLetterRepository;
import com.green.jobhunter.repository.DesiredAreaRepository;
import com.green.jobhunter.repository.DesiredIndustryRepository;
import com.green.jobhunter.repository.EnterpriseRepository;
import com.green.jobhunter.repository.HunterRepository;
import com.green.jobhunter.repository.MainCategoryRepository;
import com.green.jobhunter.repository.MemberRepository;
import com.green.jobhunter.repository.PostingRepository;
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
	@Autowired
	PostingRepository postingRepository;
	@Autowired
	EnterpriseRepository enterpriseRepository;
	@Autowired
	ApplicationRepository applicationRepository;
	@Autowired
	OfferRepository offerRepository;
	
	
	
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

	// 이력서를 실제로 등록하는 기능
	@RequestMapping("/resumeWrite")
	public String addResume(HttpServletRequest req,
			HunterDto h,
			ResumeDto r,
			DesiredAreaDto da,
			DesiredIndustryDto di,
			CareerDto c,
			CoverLetterDto cl,
			ResumeSkillDto rs,
			CertificateDto ctf,
			Model model) {

		Member member = memberRepository.findByMemId((String) req.getSession().getAttribute("logged"));
		Hunter hunter = hunterRepository.findByHid(member);
		if (hunter == null) {
			hunter = new Hunter();
		}
		// hunter 정보
		hunter.setHid(member);
		hunter.setUsername(h.getUsername());
		hunter.setBirth(h.getBirth());
		hunter.setTel(h.getTel());
		hunter.setTel2(h.getTel2());
		hunter.setAddress(h.getAddress());
		hunter.setEmail(h.getEmail());
		hunter.setGender(h.getGender());
		hunter.setMilitary(h.getMilitary());
		hunter.setReportnum(h.getReportnum());
		hunterRepository.save(hunter);

		// resume 정보
		Resume resume = new Resume();
		resume.setHid(member);
		resume.setTitle(r.getTitle());
		resume.setEduname(r.getEduname());
		resume.setEdutype(r.getEdutype());
		resume.setEdumajor(r.getEdumajor());
		resume.setEdustate(r.getEdustate());
		resume.setGraduatedate(r.getGraduatedate());
		resume.setModifydate(LocalDate.now());
		resume.setPhotourl(r.getPhotourl());
		resume.setDesiredpay(r.getDesiredpay());
		resume.setPublictype(r.getPublictype());
		resumeRepository.save(resume);

		// desiredArea 정보
		DesiredArea dArea = new DesiredArea();
		dArea.setResumecode(resume);
		dArea.setHid(member);
		dArea.setArea1(da.getArea1());
		dArea.setArea2(da.getArea2());
		desiredAreaRepository.save(dArea);

		// desiredIndustry 정보
		DesiredIndustry dIndustry = new DesiredIndustry();
		dIndustry.setResumecode(resume);
		dIndustry.setHid(member);
		dIndustry.setMainCategory(di.getMainCategory());
		dIndustry.setMiddleCategory(di.getMiddleCategory());
		desiredIndustryRepository.save(dIndustry);

		// career 정보
		Career career = new Career();
		career.setResumecode(resume);
		career.setHid(member);
		career.setCompanyname(c.getCompanyname());
		career.setCardate(c.getCardate());
		career.setEnddate(c.getEnddate());
		career.setIndustry(c.getIndustry());
		career.setPosition(c.getPosition());
		career.setJob(c.getJob());
		career.setWork(c.getWork());
		career.setSalary(c.getSalary());
		careerRepository.save(career);

		// resumeSkill 정보
		ResumeSkill resumeSkill = new ResumeSkill();
		resumeSkill.setHid(member);
		resumeSkill.setResumecode(resume);
		resumeSkill.setStack(rs.getStack());
		resumeSkillRepository.save(resumeSkill);

		// coverLetter 정보
		CoverLetter coverLetter = new CoverLetter();
		coverLetter.setResumecode(resume);
		coverLetter.setGrowth(cl.getGrowth());
		coverLetter.setMotive(cl.getMotive());
		coverLetter.setProsAndCons(cl.getProsAndCons());
		coverLetterRepository.save(coverLetter);

		// certificate 정보
		Certificate cer = new Certificate();
		cer.setHid(member);
		cer.setResumecode(resume);
		cer.setPublisher(ctf.getPublisher());
		cer.setIssuedate(ctf.getIssuedate());
		certificateRepository.save(cer);

		// memberRepository.save();

		return "redirect:/hunter/resumeList";
	}

	// 이력서수정폼
	@RequestMapping("/resumeUpdateForm")
	public String updateResumeForm(HttpServletRequest req, Model model) {

		Long resumecode_ = Long.parseLong(req.getParameter("resumecode"));
		List<MainCategory> mainList = mainCategoryRepository.findAll();
		List<SubCategory> subList = subCategoryRepository.findAll();
		HttpSession session = req.getSession();

		Member member = memberRepository.findByMemberid((String) session.getAttribute("logged"));
		Hunter hunter = hunterRepository.findByHid(member);
		Resume resume = resumeRepository.findByResumecode(resumecode_);
		DesiredArea desiredArea = desiredAreaRepository.findByResumecode(resume);
		DesiredIndustry desiredIndustry = desiredIndustryRepository.findByResumecode(resume);
		Career career = careerRepository.findByResumecode(resume);
		CoverLetter coverLetter = coverLetterRepository.findByResumecode(resume);
		ResumeSkill resumeSkill = resumeSkillRepository.findByResumecode(resume);
		Certificate certificate = certificateRepository.findByResumecode(resume);

		model.addAttribute("mainList", mainList);
		model.addAttribute("subList", subList);
		model.addAttribute("hunter", hunter);
		model.addAttribute("resume", resume);
		model.addAttribute("da", desiredArea);
		model.addAttribute("di", desiredIndustry);
		model.addAttribute("c", career);
		model.addAttribute("cl", coverLetter);
		model.addAttribute("rs", resumeSkill);
		model.addAttribute("ctf", certificate);
		System.out.println(" ========================= 여기3번째 실행 완료 =========================");

		return "/hunter/resumeUpdateForm";
	}

	// 이력서를 실제로 수정하는 기능
	@RequestMapping("/resumeUpdate")
	public String updateResume(Member m, Hunter h, Resume r, DesiredArea da, DesiredIndustry di,
			Career c, CoverLetter cl, ResumeSkill rs, Certificate ctf, HttpServletRequest req) {

		HttpSession session = req.getSession();
		String memberid = (String) session.getId();

		System.out.println("=========================------------------=======================");
		System.out.println(memberid);
		System.out.println(memberid);
		System.out.println(memberid);
		System.out.println(memberid);
		System.out.println(memberid);
		System.out.println("=========================------------------=======================");

		Member member = memberRepository.findByMemberid((String) session.getAttribute("logged"));
		String resumecode_ = req.getParameter("resumecode");
		Long resumecode = Long.parseLong(resumecode_);
		// hunter 정보
		Hunter hunter = hunterRepository.findByHid(member);
		hunter.setUsername(h.getUsername());
		hunter.setBirth(h.getBirth());
		hunter.setTel(h.getTel());
		hunter.setTel2(h.getTel2());
		hunter.setAddress(h.getAddress());
		hunter.setEmail(h.getEmail());
		hunter.setGender(h.getGender());
		hunter.setMilitary(h.getMilitary());
		hunter.setReportnum(h.getReportnum());

		// resume 정보
		Resume resume = resumeRepository.findByResumecode(resumecode);
		resume.setEmploymenttype(r.getEmploymenttype());
		resume.setTitle(r.getTitle());
		resume.setEduname(r.getEduname());
		resume.setEdutype(r.getEdutype());
		resume.setEdumajor(r.getEdumajor());
		resume.setEdustate(r.getEdustate());
		resume.setGraduatedate(r.getGraduatedate());
		resume.setModifydate(LocalDate.now());
		resume.setPhotourl(r.getPhotourl());
		resume.setDesiredpay(r.getDesiredpay());
		resume.setPublictype(r.getPublictype());

		// desiredArea 정보
		DesiredArea dArea = desiredAreaRepository.findByResumecode(resume);
		dArea.setResumecode(resume);
		dArea.setHid(member);
		dArea.setArea1(da.getArea1());
		dArea.setArea2(da.getArea2());

		// desiredIndustry 정보
		DesiredIndustry dIndustry = desiredIndustryRepository.findByResumecode(resume);
		dIndustry.setHid(member);
		dIndustry.setResumecode(resume);
		dIndustry.setMainCategory(di.getMainCategory());
		dIndustry.setMiddleCategory(di.getMiddleCategory());

		// career 정보
		Career career = careerRepository.findByResumecode(resume);
		career.setHid(member);
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
		ResumeSkill resumeSkill = resumeSkillRepository.findByResumecode(resume);
		resumeSkill.setResumecode(resume);
		resumeSkill.setHid(member);
		resumeSkill.setStack(rs.getStack());

		// coverLetter 정보
		CoverLetter coverLetter = coverLetterRepository.findByResumecode(resume);
		coverLetter.setResumecode(resume);
		coverLetter.setGrowth(cl.getGrowth());
		coverLetter.setMotive(cl.getMotive());
		coverLetter.setProsAndCons(cl.getProsAndCons());

		// certificate 정보
		Certificate cer = certificateRepository.findByResumecode(resume);
		cer.setResumecode(resume);
		cer.setCerticode(resumecode);
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
		// memberRepository.save();

		return "redirect:/hunter/resumeList";
	}

	// 이력서목록페이지
	@RequestMapping("/resumeList")
	public String goResumeList(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		Member member = memberRepository.findByMemberid((String) session.getAttribute("logged"));
		System.out.println(member);
		List<Resume> resume = resumeRepository.findByHid(member);

		System.out.println("====================================");
		System.out.println(resume);
		System.out.println("====================================");
		model.addAttribute("resume", resume);

		return "/hunter/resumeList";
	}

	@RequestMapping("/resumeList2")
	public String goResumeList2(HttpServletRequest request, Model model) {
		// 해당인재의 이력서목록
		String hid = request.getParameter("hid");
		List<Resume> resume2 = resumeRepository.findByHid(hid);
		model.addAttribute("resume", resume2);

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

	// 입사지원 리스트 페이지
	@RequestMapping("/jobApplication")
	public String jobApplication(HttpServletRequest req, Model model) {

		// 로그인된(logged) 사용자가 필요. (Member memberid 이용?)
		String logged_id = (String) req.getSession().getAttribute("logged");
		String result = (String) req.getParameter("result");
		if (result == null) {
			result = "대기";
		}

		// 로그인된 사용자가 없으면 로그인 페이지로 보내기
		if (logged_id == null) {
			return "/main/loginForm";
		}

		// 세션에서 로그인된 사용자 정보를 가져옴
		Member member = memberRepository.findByMemId(logged_id);
		if (member == null) {
			return "redirect:/";
		}

		// hunter 객체를 가져옴 (내가(hunter)가 입사지원한 입사지원 리스트를 갖고 와야 하니까)
		Hunter hunter = hunterRepository.findByHid(member);
		// 없으면 그냥 메인으로 보내
		if (hunter == null) {
			return "redirect:/";
		}

		// 로그인한 구직자가 입사지원한 채용공고 리스트 가져오기
		List<Posting> appPostList = postingRepository.findMyApplyList(logged_id, result);
		model.addAttribute("appPostList", appPostList);
		model.addAttribute("result", result);
		return "/hunter/jobApplication";
	}

	@RequestMapping("/subscribeList")
	public String subscribeList() {

		return "/hunter/subscribeList";
	}

	@RequestMapping("/offerList")
	public String positionList(HttpServletRequest req, Model model, 
			OfferDto offerDto) {
		
		String logged_id = (String) req.getSession().getAttribute("logged");
		Member member = memberRepository.findByMemId(logged_id);	
		// 회사 아이디를 가진 멤버 필요.
		Enterprise enterprise = enterpriseRepository.findByEid(logged_id);
		// 구직자 아이디를 가진 멤버 필요.
		Hunter hunter = hunterRepository.findByHid(member);
		// 회사 -> 구직자 : 채용공고 정보의 일부 managetel, deadline, result를 같이 전달함 -> offer 객체
		String hid = member.getMemberid();
		List<Offer> offerList = offerRepository.findByHid(hid);
		
		model.addAttribute("offList", offerList);

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
		String logged_id = (String) session.getAttribute("logged");
		Member member = memberRepository.findByMemId(logged_id);
		Hunter hunter = hunterRepository.findByHid(member);
		model.addAttribute("hunter", hunter);
		model.addAttribute("meme", member);
		return "/hunter/hunterForm";
	}

	@RequestMapping("/saveHunterForm")
	public String saveHunterForm(HttpServletRequest req, HunterDto h, Member m) {
		HttpSession session = req.getSession();
		Member member = memberRepository.findByMemId((String) session.getAttribute("logged"));
		Hunter hunter = hunterRepository.findByHid(member);
		if (hunter == null) {
			hunter = new Hunter();
		}
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

		return "redirect:/hunter/";
	}

	@RequestMapping("/postDetail")
	public String postDetail(@RequestParam("postcode") long postcode, Model model) {
		Posting posting = postingRepository.findByPostcode(postcode);
		model.addAttribute("dto", posting);
		model.addAttribute("postcode", postcode);
		return "/main/postDetail";
	}

}