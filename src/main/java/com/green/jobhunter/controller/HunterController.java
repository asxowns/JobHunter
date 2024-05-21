package com.green.jobhunter.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.jobhunter.entity.Career;
import com.green.jobhunter.entity.Certificate;
import com.green.jobhunter.entity.CoverLetter;
import com.green.jobhunter.entity.DesiredArea;
import com.green.jobhunter.entity.DesiredIndustry;
import com.green.jobhunter.entity.Hunter;
import com.green.jobhunter.entity.MainCategory;
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
   public String root() {
      return "/home";
   }

   @RequestMapping("/hunterpage")
   public String goHunterPage() {
      return "/hunter/hunterPage";
   }

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

   @RequestMapping("/resumeWrite")
   public String addResume(HttpServletRequest req, Model model) {
      Hunter hunter = (Hunter) hunterRepository.findAll();
      Resume resume = (Resume) resumeRepository.findAll();
      DesiredArea dArea = (DesiredArea) desiredAreaRepository.findAll();
      DesiredIndustry dIndustry = (DesiredIndustry) desiredIndustryRepository.findAll();
      Certificate certificate = (Certificate) certificateRepository.findAll();
      Career career = (Career) careerRepository.findAll();
      CoverLetter coverLetter = (CoverLetter) coverLetterRepository.findAll();
      ResumeSkill resumeSkill = (ResumeSkill) resumeSkillRepository.findAll();

      // hunter 정보
      hunter.setUsername("username");
      String birth_ = req.getParameter("birth");
      LocalDate birth = LocalDate.parse(birth_);
      hunter.setBirth(birth);
      hunter.setTel(req.getParameter("tel"));
      hunter.setTel2(req.getParameter("tel2"));
      hunter.setAddress(req.getParameter("address"));
      hunter.setEmail(req.getParameter("email"));
      String gender_ = req.getParameter("gender");
      hunter.setGender(gender_.charAt(0));
      String military_ = req.getParameter("military");
      hunter.setMilitary(military_.charAt(0));

      hunterRepository.save(hunter);

      
      // resume 정보

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
      //String modifydate_ = req.getParameter("modifydate_");
      //resumeWriteForm에서 modifydate는 받지 않음. 등록 누르는 순간의 시간을 받아오면 될 것 같음
      //LocalDate modifydate = LocalDate.parse(modifydate_);
      //resume.setModifydate(modifydate);
      resume.setPhotourl(req.getParameter("photourl"));
      String desirepay_ = req.getParameter("desiredpay");
      int desirepay = Integer.parseInt(desirepay_);
      resume.setDesirepay(desirepay);
      String publictype_ = req.getParameter("publictype");
      resume.setPublictype(publictype_.charAt(1));

      resumeRepository.save(resume);

      // desiredArea 정보
      dArea.setResumecode(resume);
      dArea.setArea1(req.getParameter("area1"));
      dArea.setArea1(req.getParameter("area2"));

      desiredAreaRepository.save(dArea);

      // desiredIndustry 정보
      dIndustry.setResumecode(resume);
      dIndustry.setMainCategory(req.getParameter("industry"));
      dIndustry.setMiddleCategory(req.getParameter("middleCategory"));


      // career 정보
      career.setCompanyname(req.getParameter("companyname"));
      LocalDate cardate = LocalDate.parse(req.getParameter("cardate"));
      career.setCardate(cardate);
      String working = req.getParameter("working");
      if(working.equals("off")){
         LocalDate enddate = LocalDate.parse(req.getParameter("enddate"));
         career.setEnddate(enddate);
      }
      career.setPosition(req.getParameter("position"));
      career.setJob(req.getParameter("job"));
      career.setSalary(req.getParameter("salary"));
      career.setIndustry(req.getParameter("industry"));
      career.setWork(req.getParameter("work"));

      careerRepository.save(career);
      
      // resumeSkill 정보
      String skills_ = req.getParameter("resumeSkill");
      String[] skills = skills_.split(",");
      
      for(int i = 0; i < skills.length; i++) {
         resumeSkill.setResumecode(resume);
         resumeSkill.setStack(skills[i]);
         resumeSkillRepository.save(resumeSkill);
      }

      // coverLetter 정보
      coverLetter.setResumecode(resume);
      coverLetter.setGrowth(req.getParameter("growth"));
      coverLetter.setMotive(req.getParameter("motive"));
      coverLetter.setProsAndCons(req.getParameter("prosAndCons"));

      coverLetterRepository.save(coverLetter);

      // certificate 정보
      certificate.setPublisher(req.getParameter("certificate"));
      LocalDate issuedate = LocalDate.parse(req.getParameter("optaindate"));
      certificate.setIssuedate(issuedate);
      certificate.setPublisher(req.getParameter("issuer"));

      certificateRepository.save(certificate);

      return "redirect:/hunter/resumeList";

   }

   @RequestMapping("/resumeList")
   public String goResumeList(HttpServletRequest req, Model model) {
      HttpSession session = req.getSession();
      String logged = (String) session.getAttribute("logged");
      // Long resumecode = Long.parseLong(req.getParameter("resumecode"));
      //Member member = memberRepository.findByMemberid(logged);
      //String title = resumeRepository.findTitle(member);
      if(!logged.isEmpty()) {
    	  Resume resume = (Resume) resumeRepository.findAll();
    	  model.addAttribute("resume", resume);
      }
      

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

}