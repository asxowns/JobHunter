package com.green.jobhunter.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.jobhunter.entity.Enterprise;
import com.green.jobhunter.entity.Hunter;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Posting;
import com.green.jobhunter.repository.EnterpriseRepository;
import com.green.jobhunter.repository.HunterRepository;
import com.green.jobhunter.repository.MemberRepository;
import com.green.jobhunter.repository.PostingRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	static Enterprise enterprise = null;
	static Member eid = null;
	@Autowired
	MemberRepository memberrepository;
	@Autowired
	EnterpriseRepository enterrepository;
	@Autowired
	HunterRepository hunterrepository;

	@Autowired
	PostingRepository postingrepository;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpServletResponse response;

	@RequestMapping("/")
	public String root(Model model) {

		List<Posting> list = postingrepository.findAll();
		model.addAttribute("list", list);

		return "/main/postList";
	}

	@RequestMapping("/registForm")
	public String regForm() {

		return "/main/registForm";
	}

	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/main/loginForm";
	}

	@RequestMapping("/hunterregist")
	public String regist(Hunter hunter, Member member, Model model) {
		System.out.println("===================================헌터" + hunter);
		System.out.println("===================================멤버" + member);
		member.setRole('h');
		hunter.setHid(member);
		memberrepository.save(member);
		hunterrepository.save(hunter);

		return "/main/registForm";
	}

	@RequestMapping("/enterregist")
	public String regist(Member member, Enterprise enterprise) {

		member.setRole('e');
		enterprise.setEid(member);
		memberrepository.save(member);
		enterrepository.save(enterprise);
		return "/main/registForm";
	}

	@RequestMapping("/loginHunter")
	public String loginHunter(@RequestParam("id") String id, @RequestParam("pw") String pw, Model model)
			throws IOException {
		Member member = memberrepository.findByMem(id, pw);
		System.out.println("==========================member : " + member);
		if (member == null) {
			return "/main/loginForm";
		}

		HttpSession session = request.getSession();

		if (member != null & member.getRole() == 'h') {
			session = request.getSession();

			session.setAttribute("logged", id);
			session.setAttribute("pw", pw);
			session.setAttribute("role", member.getRole());
			return "/main/postList";
		} else if (member.getRole() != 'h') {
			String msg = "일반회원이 아닙니다";
			model.addAttribute("msg", msg);
		}
		return "/loginForm";
	}

	@RequestMapping("/loginEnterprise")
	public String loginEnterprise(@RequestParam("id") String id, @RequestParam("pw") String pw, Model model) {
		Member member = memberrepository.findByMem(id, pw);
		System.out.println("==========================member : " + member);
		if (member == null) {
			return "/main/loginForm";
		}

		if (member != null & member.getRole() == 'e') {
			HttpSession session = request.getSession();
			// model.addAttribute("msg", "로그인에 성공하였습니다");
			// model.addAttribute("msg2", "메인으로");
			// model.addAttribute("url", "main");
			session.setAttribute("logged", id);
			session.setAttribute("pw", pw);
			session.setAttribute("role", member.getRole());
			return "/enter/enterprisePage";
		}
		return "";
	}

	@RequestMapping("/checkId")
	public @ResponseBody String checkId(@RequestParam("id") String id) {
		Member member = memberrepository.findByMemId(id);
		System.out.println(member);
		String regex = "^[a-z][a-z0-9_-]{4,19}$";
		if (id.equals("")) {
			return "";

		}
		if (member != null) {
			return "중복입니다";

		}

		else if (!id.matches(regex)) {
			return "아이디는 5~20자 영문소문자,특수문자,숫자 포함";
		}
		return "";
	}

	@RequestMapping("/checkPw")
	public @ResponseBody String checkPw(@RequestParam("pw") String pw) {
		String regex = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,16}$";
		if (pw.equals("")) {
			return "";

		} else if (!pw.matches(regex)) {
			return "비밀번호는 8~16자 영문,특수문자,숫자포함";
		}
		return "";
	}

	@RequestMapping("/postDetail")
	public String postDetail(@RequestParam("postcode") long postcode, Model model) {
		Posting posting = postingrepository.findByPostcode(postcode);
		System.out.println("==================" + posting);
		model.addAttribute("dto", posting);
		return "/main/postDetail";
	}
	// 이름을 이용해서 회사아이디 뽑음
//	@RequestMapping("/searchMain3Region")
//	public String searchMain3Region(@RequestParam(name = "companyname", required = false) String companyname,
//	        @RequestParam(name = "area", required = false) String area,
//	        @RequestParam(name = "career", required = false) String career,
//	        @RequestParam(name = "edutype", required = false) String edutype, Model model) {
//		
//		
//		
//		System.out.println("==========here search3=======================");
//	
//		
//		if (companyname != null && !companyname.isEmpty()) {
//			System.out.println("===============================companyname:"+companyname);
//			enterprise = enterrepository.findByCompanyname(companyname);
//			System.out.println("============================enterprise:"+enterprise);
//			String memid= enterprise.getEid().getMemberid();
//			System.out.println("============================memid:"+memid);
//
//			Member eid = memberrepository.findByMemberid(memid);
//			System.out.println("============================eid:"+eid);
//			System.out.println("============================area:"+area);
//			System.out.println("============================career:"+career);
//			System.out.println("============================edutype:"+edutype);
//
//			List<Posting> list = postingrepository.findByEidAndAreaAndCareerAndEdutype(eid, area, career, edutype);
//			System.out.println("============================list:"+list);
//			List<Posting> list2 = postingrepository.findByEid(eid);
//			System.out.println("============================list2:"+list2);
//			model.addAttribute("list",list);
//			
//		
//		}else if(companyname== null &&companyname.isEmpty()) {
//			System.out.println("=============company이름 null================");
//			
//			System.out.println("=============career================"+career);
//			System.out.println("=============edutype================"+edutype);
//			if (career==null) {
//				System.out.println("===============================널입니다=");
//			}
//
//			
//			List<Posting> list = postingrepository.findByEidAndAreaAndCareerAndEdutype(eid, area, career, edutype);
//			System.out.println("============================list:"+list);
//			model.addAttribute("list",list);
//		}
//		return "/main/postList";
//	}

	@RequestMapping("/searchFilter")
	public String searchFilter(@RequestParam(name = "companyname_", required = false) String companyname_,
			@RequestParam(name = "area_", required = false) String area_,
			@RequestParam(name = "career_", required = false) String career_,
			@RequestParam(name = "edutype_", required = false) String edutype_, Model model) {

		System.out.println("==========here search3=======================");
		String companyname;
		String area;
		String career;
		String edutype;
		if (companyname_.isEmpty()) {
			companyname = null;
			
			System.out.println(companyname_);
			System.out.println(companyname);
		}else {
			companyname=companyname_;
			System.out.println(companyname_);
			System.out.println(companyname);
		}

		if (area_.isEmpty()) {
			area = null;
		}else {
			area=area_;
		}
		
		if (career_.isEmpty()) {
			career = null;
		}else {
			career=career_;
		}
		
		if (edutype_.isEmpty()) {
			edutype = null;
		}else {
			edutype=edutype_;
		}
		
		
		
		
		if (!companyname_.isEmpty()) {
			System.out.println("===============================companyname_:" + companyname_);
			enterprise = enterrepository.findByCompanyname(companyname);
			System.out.println("============================enterprise:" + enterprise);
			String memid = enterprise.getEid().getMemberid();
			System.out.println("============================memid:" + memid);

			Member eid = memberrepository.findByMemberid(memid);
			System.out.println("============================eid:" + eid);
			System.out.println("============================area:" + area);
			System.out.println("============================career:" + career);
			System.out.println("============================edutype:" + edutype);

			List<Posting> list = postingrepository.findByEidAndAreaAndCareerAndEdutype(eid, area, career, edutype);
			System.out.println("============================list:" + list);
			List<Posting> list2 = postingrepository.findByEid(eid);
			System.out.println("============================list2:" + list2);
			model.addAttribute("list", list);

		} else if (companyname_.isEmpty()) {
			System.out.println("=============company이름 null================");

			System.out.println("=============career_================" + career_);
			System.out.println("=============edutype_================" + edutype_);
			if (career_ == null) {
				System.out.println("===============================널입니다=");
			}

			List<Posting> list = postingrepository.findByEidAndAreaAndCareerAndEdutype(eid, area, career, edutype);
			System.out.println("============================list:" + list);
			model.addAttribute("list", list);
		}
		return "/main/postList";
	}

//	로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession();

		session.invalidate();

		return "/main/loginForm";
	}

}
