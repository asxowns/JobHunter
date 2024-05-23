package com.green.jobhunter.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.jobhunter.dto.TalentInfoDto;
import com.green.jobhunter.entity.Application;
import com.green.jobhunter.entity.Enterprise;
import com.green.jobhunter.entity.MainCategory;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Posting;
import com.green.jobhunter.entity.Resume;
import com.green.jobhunter.repository.ApplicationRepository;
import com.green.jobhunter.repository.EnterpriseRepository;
import com.green.jobhunter.repository.HunterRepository;
import com.green.jobhunter.repository.MainCategoryRepository;
import com.green.jobhunter.repository.MemberRepository;
import com.green.jobhunter.repository.PostingRepository;
import com.green.jobhunter.repository.ResumeRepository;

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
	@Autowired
	MainCategoryRepository mainCategoryRepository;
	@Autowired
	HunterRepository hunterRepository;
	@Autowired
	ResumeRepository resumeRepository;
	@Autowired
	ApplicationRepository applicationRepository;
	@Autowired
	TalentInfoDto talentInfoDto;
	
	@RequestMapping("/")
    public String root(){
    	
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
    public String enterpriseUpdate(@RequestParam("entercode") Long entercode,
    		@RequestParam("password") String password, @RequestParam("companyname") String companyname, 
    		@RequestParam("corporatetype") String corporatetype, @RequestParam("managertel") String managertel, 
    		@RequestParam("manageremail") String manageremail, @RequestParam("businessnumber") String businessnumber, 
    		@RequestParam("managername") String managername, @RequestParam("sales") int sales, @RequestParam("empnum") int empnum,
    		@RequestParam("address") String address, @RequestParam("businessitem") String businessitem, @RequestParam("tel") String tel) {
    	
    	Enterprise enter = enterpriseRepository.findByEntercode(entercode);
    	enter.setCompanyname(companyname);
    	enter.setCorporatetype(corporatetype);
    	enter.setManagertel(managertel);
    	enter.setManageremail(manageremail);
    	enter.setBusinessnumber(businessnumber);
    	//
    	enter.setManagername(managername);
    	enter.setSales(sales);
    	enter.setEmpnum(empnum);
    	enter.setAddress(address);
    	enter.setBusinessitem(businessitem);
    	enter.setTel(tel);
    	
    	
    	String id = (String)session.getAttribute("logged");
    	Member member = memberRepository.findByMemberid(id);
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
    	
    	//지원자리스트 (구직자정보 / 해당공고정보)
    	List<Application> applications = applicationRepository.findByPostcode(posting);
        model.addAttribute("application", applications);
        
    	return "/enter/hunterPerPostList";
    }
    //채용공고 등록 폼, 해당공고 수정 폼
    @RequestMapping("/enterprisePostWriteForm")
    public String enterprisePostWriteForm(Model model, HttpServletRequest request) {
    	String formType = request.getParameter("formType");
    	List<MainCategory> mainList = mainCategoryRepository.findAll();
    	model.addAttribute("mainList",mainList);
    	if("register".equals(formType)) {
            // 등록 폼
            model.addAttribute("formType", "register");
    	}else {
            Long postcode = Long.parseLong(request.getParameter("postcode"));
            Posting posting = postingRepository.findByPostcode(postcode);
            model.addAttribute("posting", posting);
            model.addAttribute("formType", "edit");
            
        }
    	return "/enter/enterprisePostWriteForm";
    }
    
    //채용공고 등록 
    @RequestMapping("/enterprisePostWrite")
    public String enterpriseWrite(HttpServletRequest request, Model model) {
    	session = request.getSession();
    	Member eid = memberRepository.findByMemberid((String)session.getAttribute("logged"));
    	Posting posting = new Posting();
    	
    	// 기업 아이디 설정
        posting.setEid(eid);
        // 폼으로부터 전달된 데이터를 채용공고 객체에 설정합니다.
        posting.setTitle(request.getParameter("title"));
        int headcount_ = Integer.parseInt(request.getParameter("headcount"));
        posting.setHeadcount(headcount_);
        posting.setEdutype(request.getParameter("edutype"));
        posting.setCareer(request.getParameter("career"));
        posting.setEmploymenttype(request.getParameter("employmenttype"));
        int pay_ = Integer.parseInt(request.getParameter("pay"));
        posting.setPay(pay_);
        posting.setArea(request.getParameter("area"));
        
        posting.setIndustry(request.getParameter("industry"));
        posting.setJob(request.getParameter("job"));
        
        String deadline_ = request.getParameter("deadline");
        LocalDate deadline = LocalDate.parse(deadline_);
        posting.setDeadline(deadline);
        
        posting.setManagertel(request.getParameter("managertel"));
        posting.setMainurl(request.getParameter("mainurl"));
        posting.setMaincontent(request.getParameter("maincontent"));
        posting.setRegdate(LocalDate.now());
        // 채용공고 저장
        postingRepository.save(posting);
        model.addAttribute("posting", posting);
    	return "redirect:/enter/enterprisePostList";
    }
    
    //해당공고 수정 기능 
    @RequestMapping("/enterprisePostUpdate")
    public String enterprisePostUpdate(HttpServletRequest request){
        Long postcode_ = Long.parseLong(request.getParameter("postcode"));
    	Posting posting = postingRepository.findByPostcode(postcode_);
        posting.setPostcode(postcode_);
        
        posting.setTitle(request.getParameter("title"));
            
        int headcount_ = Integer.parseInt(request.getParameter("headcount"));
        posting.setHeadcount(headcount_);
        posting.setEdutype(request.getParameter("edutype"));
        posting.setCareer(request.getParameter("career"));
        posting.setEmploymenttype(request.getParameter("employmenttype"));
            
        int pay_ = Integer.parseInt(request.getParameter("pay"));
        posting.setPay(pay_);
        posting.setArea(request.getParameter("area"));
        posting.setIndustry(request.getParameter("industry"));
        posting.setJob(request.getParameter("job"));
            
        String deadline_ = request.getParameter("deadline");
        LocalDate deadline = LocalDate.parse(deadline_);
        posting.setDeadline(deadline);
            
        posting.setManagertel(request.getParameter("managertel"));
        posting.setMainurl(request.getParameter("mainurl"));
        posting.setMaincontent(request.getParameter("maincontent"));
        posting.setRegdate(LocalDate.now());
            
        // 수정된 채용공고를 저장
        postingRepository.save(posting);
           
    	return "redirect:/enter/enterprisePostList";
    }
    
    //해당 채용공고 삭제 ok
    @RequestMapping("/enterprisePostDelete")
	public String delete(@RequestParam("postcode") Long postcode) {
    	postingRepository.deleteBypostcode(postcode);
    	postingRepository.deleteBypostcode2(postcode);
    	postingRepository.deleteBypostcode3(postcode);
		
		return "redirect:/enter/enterprisePostList";
	}
   
    //인재정보페이지
    @RequestMapping("/hunterList")
    public String root5(Model model){
    	List<TalentInfoDto> talentInfo = resumeRepository.findAllWithTalentInfo();
    	model.addAttribute("talentInfo", talentInfo);
    	
    	return "/enter/hunterList";  
    }
    
}
