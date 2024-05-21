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

	@RequestMapping("/searchMain3Region")
	public String searchMain3Region(@RequestParam(name = "compnyname", required = false) String compnyname,
			@RequestParam(name = "area", required = false) String area,
			@RequestParam(name = "career", required = false) String career,
			@RequestParam(name = "edutype", required = false) String edutype, Model model) {

//		Enterprise enterprise = enterrepository.findByCompanyname(compnyname);
//		if (enterprise != null) {
//			Member eid = memberrepository.findByMemberid()
//			List<Posting> list = postingrepository.findByEidAndAreaAndCareerAndEdutype(eid, area, career, edutype);
//		}else {
//			eid=null;
//		}
		return "/main/main";
	}
	
//	로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession();

		session.invalidate();

		return "/main/loginForm";
	}
	
	

}
