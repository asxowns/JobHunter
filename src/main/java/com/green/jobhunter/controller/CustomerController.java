package com.green.jobhunter.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;

import com.green.jobhunter.entity.Cs;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.repository.CsRepository;
import com.green.jobhunter.repository.MemberRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/cs")
public class CustomerController {
	
	@Autowired
	private CsRepository csRepository;
	
	@Autowired
	private MemberRepository memberRepository;

	@RequestMapping("/home")
	public String home() {
		return "/home";
	}
	
	@RequestMapping("/csList")
	public String csList(HttpServletRequest request,Model model) {
		List<Cs> a = csRepository.findAll();
		List<Cs> b = csRepository.findByTypeAndPublictype('A', 'Y');
		HttpSession session = request.getSession();
		String logged = (String)session.getAttribute("id");
		Member logged_member = memberRepository.findByMemberid(logged);
		 List<Cs> c = csRepository.findByHid(logged_member);

    	model.addAttribute("list", a);
    	model.addAttribute("list2", b);
    	model.addAttribute("list3", c);

		return "/cs/csList";
	}
	
	@RequestMapping("/forumMyDetail")
	public String forumMyDetail(@RequestParam("cscode") Long cscode, Model model) {
		
		Cs cs = csRepository.findByCscode(cscode);
		model.addAttribute("cs", cs);
		return "/cs/forumMyDetail";
	}

	@RequestMapping("/forumDetail")
	public String forumDetail(HttpServletRequest request, @RequestParam("cscode") Long cscode, Model model) {
		HttpSession session = request.getSession();
		String logged = (String)session.getAttribute("id");
		Cs cs = csRepository.findByCscode(cscode);
		model.addAttribute("cs", cs);
		return "/cs/forumDetail";
	}


	@RequestMapping("/forumWriteForm")
	public String forumWriteForm(Model model) {
		return "/cs/forumWriteForm";
	}

	@RequestMapping("/forumUpdateForm")
	public void forumUpdateForm(@RequestParam("cscode") String cscode, Model model){
		Long cscode_ = Long.parseLong(cscode);
		Cs cs = csRepository.findByCscode(cscode_);
		
		model.addAttribute("cs", cs);
		
	}
   
	@RequestMapping("/Update")
	public String forumUpdateForm(@RequestParam("cscode") String cscode
			,@RequestParam("title") String title
			,@RequestParam("content") String content
			,Model model
			){
		Long cscode_ = Long.parseLong(cscode);
		Cs cs = csRepository.findByCscode(cscode_);
		System.out.println(cs + "====================================================");
		model.addAttribute("cs", cs);
		
		LocalDate csdate = LocalDate.now();

		cs.setTitle(title);
		cs.setContent(content);
		cs.setCsdate(csdate);
		csRepository.save(cs);
		return "redirect:/cs/csList";

	}	
    
	@RequestMapping("/delete")
	public String delete(@RequestParam("cscode") Long cscode, Model model){
		Cs cs = csRepository.findByCscode(cscode);
		csRepository.delete(cs);

		return "redirect:/cs/csList";
	}
	

    @RequestMapping("/write")
    public String write(@RequestParam("content") String content
    		,@RequestParam("public_type") char publictype
    		,@RequestParam("title") String title
    		,@RequestParam("type") char type
    		,@RequestParam("hid") String hid
    		){
    	
    	LocalDate csdate = LocalDate.now();
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
