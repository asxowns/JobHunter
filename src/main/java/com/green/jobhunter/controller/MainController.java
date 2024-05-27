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

import com.green.jobhunter.entity.Application;
import com.green.jobhunter.entity.Enterprise;
import com.green.jobhunter.entity.Favorite;
import com.green.jobhunter.entity.Hunter;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.entity.Posting;
import com.green.jobhunter.entity.Subscribe;
import com.green.jobhunter.repository.ApplicationRepository;
import com.green.jobhunter.repository.EnterpriseRepository;
import com.green.jobhunter.repository.FavoriteRepository;
import com.green.jobhunter.repository.HunterRepository;
import com.green.jobhunter.repository.MemberRepository;
import com.green.jobhunter.repository.PostingRepository;
import com.green.jobhunter.repository.SubscribeRepository;

import jakarta.persistence.EntityManager;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.text.SimpleDateFormat; 



@Controller
public class MainController {
	static Enterprise enterprise = null;
	static Member eid = null;
	static long cnt = 0;
	static long scrabcnt=0;
	@Autowired
	MemberRepository memberrepository;
	@Autowired
	EnterpriseRepository enterrepository;

	@Autowired
	SubscribeRepository subscriberepostory;
	@Autowired
	private EntityManager entityManager;
	@Autowired
	HunterRepository hunterrepository;
	
	@Autowired
	FavoriteRepository favoriteRepository;
	
	
	
	@Autowired
	ApplicationRepository applicationrepository;

	@Autowired
	PostingRepository postingrepository;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpServletResponse response;

	@RequestMapping("/")
	public String root(Model model) {

		List<Posting> list1 = postingrepository.findAll();
		List<Enterprise> list2 = enterrepository.findAll();
		System.out.println(list2);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);

		return "/main/postList";
	}

	@RequestMapping("/enterpriseList")
	public String enterpriseList(Model model) {
		List<Enterprise> list = enterrepository.findAll();
		
		
		model.addAttribute("list",list);
		
		return "/main/enterpriseList";
	}

	@RequestMapping("/enterpriseDetail")
	public String enterpriseDetail(@RequestParam("entercode") long entercode, Model model) {
		enterprise = enterrepository.findByEntercode(entercode);
		List<Posting> posting = postingrepository.findByEid(enterprise.getEid());
		model.addAttribute("dtoEnter",enterprise);
		model.addAttribute("list1",posting);
		return "/main/enterpriseDetail";
	}

	@RequestMapping("/registForm")
	public String regForm(Model model) {
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = sdf.format(now);
		model.addAttribute("currentDate", currentDate);
		return "/main/registForm";
	}

	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/main/loginForm";
	}

	@RequestMapping("/hunterregist")
	public String regist(Hunter hunter, Member member, Model model) {
		Member m = new Member();
		Hunter h = new Hunter();

		m.setMemberid(member.getMemberid());
		m.setPassword(member.getPassword());
		m.setRole('h');
		m.setRegdate(member.getRegdate());
		h.setHid(m);

		h.setUsername(hunter.getUsername());
		h.setBirth(hunter.getBirth());
		h.setTel(hunter.getTel());
		h.setEmail(hunter.getEmail());
		hunterrepository.save(h);

		return "/main/loginForm";
	}

	@RequestMapping("/enterregist")
	public String regist(Member member, Enterprise enterprise) {

		Member m = new Member();
		Enterprise e = new Enterprise();
		m.setMemberid(member.getMemberid());
		m.setPassword(member.getPassword());
		m.setRole('e');
		m.setRegdate(member.getRegdate());
		e.setEid(m);

		// Member savedmember = memberrepository.save(member);
		e.setEid(m);
		e.setCompanyname(enterprise.getCompanyname());
		e.setCeo(enterprise.getCeo());
		e.setTel(enterprise.getTel());
		e.setSize(enterprise.getSize());
		e.setCorporatetype(enterprise.getCorporatetype());
		e.setBusinessitem(enterprise.getBusinessitem());
		e.setBusinessnumber(enterprise.getBusinessnumber());
		e.setAddress(enterprise.getAddress());
		e.setEmpnum(enterprise.getEmpnum());
		e.setSales(enterprise.getSales());
		e.setManagername(enterprise.getManagername());
		e.setManagertel(enterprise.getManagertel());
		e.setManageremail(enterprise.getManageremail());

		entityManager.clear();

		enterrepository.save(e);

		return "/main/loginForm";
	}

	@RequestMapping("/applicate")
	public String aplication(Application application, Model model) {
		System.out.println("=======================application : " + application);
		applicationrepository.save(application);
		return "/main/postDetail";
	}

//	@RequestMapping("/enterregist")
//	public String regist(Member member, Enterprise enterprise) {
//	    System.out.println("=================================member:"+ member);
//	    // 기존에 저장된 Member 객체를 식별자 값을 통해 찾음
//	    Member existingMember = memberrepository.findByMemberid(member.getMemberid());
//	    System.out.println("=================================existingMember:"+ existingMember);
//
//	    // 기존 Member 객체가 존재하는지 확인
//	    if (existingMember != null) {
//	        // 기존 Member 객체의 필드를 새로운 값으로 업데이트
//	        existingMember.setRole('e');
//
//	        // Enterprise 객체 설정
//	        enterprise.setEid(existingMember);
//
//	        System.out.println("==============================enterprise " + enterprise);
//
//	        // 기존 Member 객체를 저장
//	        memberrepository.save(existingMember);
//	        enterrepository.save(enterprise);
//	    } else {
//	        System.out.println("=============fail============");
//	        // 기존 Member 객체가 존재하지 않으면 에러 처리 또는 다른 처리 방법 선택
//	        // 예: throw new IllegalArgumentException("해당 ID의 Member를 찾을 수 없습니다.");
//	    }
//
//	    return "/main/registForm";
//	}
//	@RequestMapping("/enterregist")
//	public String regist(MemberDto memberDto, EnterpriseDto enterprisedto) {
//
//		memberDto.setRole('e');
//		//member.setRole('e');
//		Member member =new Member();
//		member.setMemberid(memberDto.getMemberid());
//		member.setPassword(memberDto.getPassword());
//		member.setRole(memberDto.getRole());
//		System.out.println("==================================="+member.toString());
//		
//		Enterprise enterprise = new Enterprise();
//		enterprise.setEid(member);
//		enterprise.setCompanyname(enterprisedto.getCompanyname());
//		enterprise.setCeo(enterprisedto.getCeo());
//		enterprise.setTel(enterprisedto.getTel());
//		enterprise.setSize(enterprisedto.getSize());
//		enterprise.setCorporatetype(enterprisedto.getCorporatetype());
//		enterprise.setBusinessitem(enterprisedto.getBusinessitem());
//		enterprise.setAddress(enterprisedto.getAddress());
//		enterprise.setEmpnum(enterprisedto.getEmpnum());
//		enterprise.setSales(enterprisedto.getSales());
//		
//		
//		
//		//enterprise.setEid(member);
//		System.out.println("==============================enterprise "+ enterprise);
//		memberrepository.save(member);
//		enterrepository.save(enterprise);
//		return "/main/registForm";
//	}
	@RequestMapping("/loginHunter")
	public String loginHunter(@RequestParam("id") String id, @RequestParam("pw") String pw, Model model)
			throws IOException {
		Member member = memberrepository.findByMem(id, pw);
		if (member == null) {
			String msg = "아이디와 패스워드를 정확히 입력해주세요";
			model.addAttribute("msg", msg);
			return "/main/loginForm";
		}

		HttpSession session = request.getSession();

		if (member != null & member.getRole() == 'h') {
			session = request.getSession();

			session.setAttribute("logged", id);
			session.setAttribute("pw", pw);
			session.setAttribute("role", member.getRole());
			return "redirect:/";
		} else if (member.getRole() != 'h') {
			String msg = "일반회원이 아닙니다";
			model.addAttribute("msg", msg);
			return "/main/loginForm";
		}
		return "";
	}

	@RequestMapping("/loginEnterprise")
	public String loginEnterprise(@RequestParam("id") String id, @RequestParam("pw") String pw, Model model) {
		Member member = memberrepository.findByMem(id, pw);
		if (member == null) {
			String msg = "아이디와 패스워드를 정확히 입력해주세요";
			model.addAttribute("msg", msg);
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
		} else if (member.getRole() != 'e') {
			String msg = "기업회원이 아닙니다";
			model.addAttribute("msg", msg);
			return "/main/loginForm";
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
	public String postDetail(@RequestParam("postcode") long postcode, @RequestParam("posteid") String posteid,
			Model model) {
		Posting posting = postingrepository.findByPostcode(postcode);
		eid = posting.getEid();
		Enterprise enterprise = enterrepository.findByEid(eid.getMemberid());
		System.out.println("=======================enterprise : "+enterprise.getCompanyname());
		String companyname = enterprise.getCompanyname();
		model.addAttribute("dto", posting);
		model.addAttribute("posteid", posteid);
		model.addAttribute("postcode", postcode);
		model.addAttribute("companyname", companyname);
		return "/main/postDetail";
	}

	@RequestMapping("/searchFilter")
	public String searchFilter(@RequestParam(name = "companyname_", required = false) String companyname_,
			@RequestParam(name = "area_", required = false) String area_,
			@RequestParam(name = "career_", required = false) String career_,
			@RequestParam(name = "edutype_", required = false) String edutype_, Model model) {

		String companyname;
		String area;
		String career;
		String edutype;
		if (companyname_.isEmpty()) {
			companyname = null;

			System.out.println(companyname_);
			System.out.println(companyname);
		} else {
			companyname = companyname_;
			System.out.println(companyname_);
			System.out.println(companyname);
		}

		if (area_.isEmpty()) {
			area = null;
		} else {
			area = area_;
		}

		if (career_.isEmpty()) {
			career = null;
		} else {
			career = career_;
		}

		if (edutype_.isEmpty()) {
			edutype = null;
		} else {
			edutype = edutype_;
		}

		if (!companyname_.isEmpty()) {
			enterprise = enterrepository.findByCompanyname(companyname);
			System.out.println(enterprise);
			System.out.println(enterprise);
			System.out.println(enterprise);
			System.out.println(enterprise);
			System.out.println(enterprise);
			System.out.println(enterprise);

//			if (enterprise != null) {
//				String memid = enterprise.getEid().getMemberid();
//				Member eid = memberrepository.findByMemberid(memid);
				List<Posting> list1 = postingrepository.findByCompanynameAndAreaAndCareerAndEdutype(companyname, area,
						career, edutype);
				List<Posting> list2 = postingrepository.findByEid(eid);
				System.out.println(" asdsadfsdf " + list1);
				System.out.println(" asdsadfsdf " + list1);
				System.out.println(" asdsadfsdf " + list1);
				
				model.addAttribute("list1", list1);
				System.out.println("==============================="+list1.size());
				if(list1.size()==0) {
					 String msg="검색결과가 없습니다";
//					
					 model.addAttribute("msg", msg);
				}

				
				// }else if(enterprise==null) {
				// List<Posting> list1=null;
//				// String msg="검색결과가 없습니다";
//				
//				// model.addAttribute("msg", msg);
//				// model.addAttribute("list1", list1);
//			}
			
		} else if (companyname_.isEmpty()) {

			List<Posting> list1 = postingrepository.findByCompanynameAndAreaAndCareerAndEdutype(companyname, area,
					career, edutype);
			if (list1.size() == 0) {
				String msg = "검색결과가 없습니다";
				model.addAttribute("msg", msg);

			}
			model.addAttribute("list1", list1);
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

	@RequestMapping("/subscribe")
	@ResponseBody
	public String subscribe(@RequestParam("posteid") String posteid, @RequestParam("isFilled") Boolean isFilled,
			HttpSession session, Model model) {
		cnt++;
		String sessionId = (String) session.getAttribute("logged");
		System.out.println("=====================sessionId: " + sessionId);

		// 세션에서 멤버 객체 가져오기
		Member member = memberrepository.findByMemberid(sessionId);
		System.out.println("=====================member: " + member);

		// 기업 객체 생성 (현재 코드에서는 주석 처리)
		// Enterprise enterprise = enterpriseRepository.findByEid(posteid);

		// 새로운 기업 및 구독 정보 생성
		Enterprise enterprise = enterrepository.findByEid(posteid);
		System.out.println("=====================posteid: " + posteid);
		System.out.println("=====================enterprise: " + enterprise);
		System.out.println("=====================enterprisegetMemberid(): " + enterprise.getEid().getMemberid());
		System.out.println("=====================isFilled: " + isFilled);
		Subscribe subscribe = new Subscribe();
		subscribe.setEid(enterprise);
		subscribe.setHid(member);
		if (isFilled) {
			// 구독 정보 데이터베이스에 저장
			subscriberepostory.save(subscribe);
			model.addAttribute("isFilled", true);
		} else {
			System.out.println("==========trydelete==========");
			System.out.println("============================" + enterprise.getEid());
			System.out.println("=====================enterprisegetMemberid(): " + enterprise.getEid().getMemberid());
			subscriberepostory.deleteByEntercode(enterprise.getEntercode());

			model.addAttribute("isFilled", false);
		}
		// 수정: 응답으로 빈 문자열 반환
		return "";
	}
	@RequestMapping("/scrab")
	@ResponseBody
	public String scrab(@RequestParam("postcode") long postcode,HttpSession session, Model model) {
		
		String sessionId = (String) session.getAttribute("logged");
		System.out.println("=====================sessionId: " + sessionId);

		// 세션에서 멤버 객체 가져오기
		Member member = memberrepository.findByMemberid(sessionId);
		System.out.println("=====================member: " + member);

		// 기업 객체 생성 (현재 코드에서는 주석 처리)
		// Enterprise enterprise = enterpriseRepository.findByEid(posteid);

		// 새로운 기업 및 구독 정보 생성
		System.out.println("=======================================postcode: "+postcode);
		Posting posting = postingrepository.findByPostcode(postcode);
		Favorite favorite = new Favorite();
		favorite.setPostcode(posting);
		favorite.setHid(member);
		if (scrabcnt==0) {
			// 구독 정보 데이터베이스에 저장
			favoriteRepository.save(favorite);
			scrabcnt=1;
		} else {
			System.out.println("==========trydelete==========");

			scrabcnt=0;
		}
		// 수정: 응답으로 빈 문자열 반환
		return "";
	}
}
