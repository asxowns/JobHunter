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
    
	@RequestMapping("/csList")
	public String csList() {
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
    public String selectid(HttpServletRequest request, @RequestParam("member_id") String member_id,
    		@RequestParam("role") char role, Model model) {
    	List<Cs> list = csRepository.findAll();
    	System.out.println(list);
    	model.addAttribute("list", list);
    	Member member = memberRepository.findByMemberIdAndRole(member_id,role);
    	if(member != null) {
    		HttpSession session = request.getSession();
    		session.setAttribute("member_id", member_id);
    		session.setAttribute("role", role);
    		return "/cs/csList";
    	}else {
    		return "home";
    	}
    
    }
    
    @RequestMapping("/cs/write")
    public String write(@RequestParam("cs_code") String cs_code
    		,@RequestParam("content") String content
    		,@RequestParam("public_type") char public_type
    		,@RequestParam("title") String title
    		,@RequestParam("type") char type
    		,@RequestParam("id") String id
    		,Model model
    		){
    	
    	LocalDateTime cs_date = LocalDateTime.now();

        char result = 'N';

        model.addAttribute("cs_code", cs_code);
        model.addAttribute("content", content);
        model.addAttribute("cs_date", cs_date);
        model.addAttribute("public_type", public_type);
        model.addAttribute("result", result);
        model.addAttribute("title", title);
        model.addAttribute("type", type);
        model.addAttribute("id", id);
        		
        return "redirect:/csList";
    }
    
}
