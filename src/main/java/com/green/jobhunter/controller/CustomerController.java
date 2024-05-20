package com.green.jobhunter.controller;


import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.jobhunter.entity.Cs;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.repository.CsRepository;
import com.green.jobhunter.repository.MemberRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cs")
public class CustomerController {
	
	@Autowired
	private CsRepository csRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	
    /*@RequestMapping("/csList")
    public String selectAll(Model model){
    	List<Cs> list = csRepository.findAll();
    	System.out.println(list);
    	model.addAttribute("list", list);
        return "/cs/csList";  
    } <<<<<<<<<<<<<<<이게 실제로 쓸거 매우 중요 */
    
	@RequestMapping("/home")
	public String home() {
		return "/home";
	}
	
	@RequestMapping("/csList")
	public String csList(HttpServletRequest request,Model model) {
		List<Cs> list = csRepository.findAll();
		List<Cs> list2 = csRepository.findByTypeAndPublictype('A', 'Y');
		HttpSession session = request.getSession();
		String logged = (String)session.getAttribute("hid");
		Member logged_member = memberRepository.findByMemberid(logged);
		 List<Cs> list3 = csRepository.findByHid(logged_member);
         model.addAttribute("list3", list3);
    	System.out.println(list);
    	model.addAttribute("list", list);
    	model.addAttribute("list2", list2);
    	model.addAttribute("list3", list3);

		return "/cs/csList";
	}
	
	
	
	@RequestMapping("/forumDetail")
	public String forumDetail(Model model) {
		return "/cs/forumDetail";
	}
	
	@RequestMapping("/forumWriteForm")
	public String forumWriteForm(Model model) {
		return "/cs/forumWriteForm";
	}
   
    @RequestMapping("/logindo")
    public String selectid(HttpServletRequest request, @RequestParam("memberid") String memberid,
    		@RequestParam("role") char role, Model model) {
    	List<Cs> list = csRepository.findAll();
    	System.out.println(list);
    	model.addAttribute("list", list);
    	Member member = memberRepository.findByMemberIdAndRole(memberid,role);
    	if(member != null) {
    		HttpSession session = request.getSession();
    		session.setAttribute("id", memberid);
    		session.setAttribute("role", role);
    		return "/cs/csList";
    	}else {
    		return "/home";
    	}
    
    }
    
    @RequestMapping("/write")
    public String write(@RequestParam("content") String content
    		,@RequestParam("public_type") char publictype
    		,@RequestParam("title") String title
    		,@RequestParam("type") char type
    		,@RequestParam("hid") String hid
    		){
    	
    	LocalDateTime csdate = LocalDateTime.now();
    	char result = 'N';
    	Cs cs = new Cs();
    	cs.setContent(content);
    	cs.setPublictype(publictype);
    	cs.setTitle(title);
    	cs.setType(type);
    	cs.setCsdate(csdate);
    	cs.setResult(result);
    	Member member = memberRepository.findByMemberid(hid);
    	member.setMemberid(hid);
    	cs.setHid(member);
    	csRepository.save(cs);
        
        
        return "redirect:/cs/csList";
    }
    
}
