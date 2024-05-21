package com.green.jobhunter.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.jobhunter.entity.Enterprise;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.repository.EnterpriseRepository;
import com.green.jobhunter.repository.MemberRepository;

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
	HttpServletRequest request;

	@Autowired
	HttpServletResponse response;

	@RequestMapping("/")
	public String root() {
		return "main/postList";
	}

	@RequestMapping("/registForm")
	public String regForm() {

		return "main/registForm";
	}

	@RequestMapping("/loginForm")
	public String loginForm() {
		return "main/loginForm";
	}

	@RequestMapping("/enterregist")
	public String regist(Enterprise enterprise) {
		enterrepository.save(enterprise);
		return "main/registForm";
	}
	
	
	@RequestMapping("/loginHunter")
	public String loginHunter(@RequestParam("id") String id, @RequestParam("pw") String pw, Model model) throws IOException {
		Member member = memberrepository.findByMem(id, pw);
		System.out.println("==========================member : " + member);
		if (member == null) {
			return "/main/loginForm";
		}
		
		PrintWriter out = response.getWriter();
		if (member != null & member.getRole() == 'h') {
			HttpSession session = request.getSession();

			session.setAttribute("logged", id);
			session.setAttribute("pw", pw);
			return "main/postList";
		}
		else if(member.getRole() != 'h') {
		String msg="일반회원이 아닙니다";
		model.addAttribute("msg",msg);
		}
		return "loginForm";
	}

	@RequestMapping("/loginEnterprise")
	public String loginEnterprise(@RequestParam("id") String id, @RequestParam("pw") String pw, Model model) {
		Member member = memberrepository.findByMem(id, pw);
		System.out.println("==========================member : " + member);
		if (member == null) {
			return "main/loginForm";
		}
		if (member != null & member.getRole() == 'e') {
			HttpSession session = request.getSession();
			// model.addAttribute("msg", "로그인에 성공하였습니다");
			// model.addAttribute("msg2", "메인으로");
			// model.addAttribute("url", "main");
			session.setAttribute("logged", id);
			session.setAttribute("pw", pw);
			return "enter/enterprisePage";
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

		} else if (member != null || !id.matches(regex)) {
			return "사용불가입니다";
		}
		return "";
	}

	@RequestMapping("/checkPw")
	public @ResponseBody String checkPw(@RequestParam("pw") String pw) {
		String regex = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,16}$";
		if (pw.equals("")) {
			return "";

		} else if (!pw.matches(regex)) {
			return "사용불가입니다";
		}
		return "";
	}

}
