package com.green.jobhunter.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.jobhunter.entity.Chat;
import com.green.jobhunter.entity.Cs;
import com.green.jobhunter.entity.Csreply;
import com.green.jobhunter.entity.Faq;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.repository.ChatRepository;
import com.green.jobhunter.repository.CsReplyRepository;
import com.green.jobhunter.repository.CsRepository;
import com.green.jobhunter.repository.FaqRepository;
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

	@Autowired
	private CsReplyRepository csReplyRepository;

	@Autowired
	private ChatRepository chatRepository;

	@Autowired
	private FaqRepository faqRepository;

	@RequestMapping("/home")
	public String home() {
		return "/home";
	}
	
	@RequestMapping("/csList")
	public String csList(HttpServletRequest request,Model model) {
		List<Faq> list = faqRepository.findAll();
		model.addAttribute("list", list);
		List<Cs> list2 = csRepository.findByTypeAndPublictype('A', 'Y');
		HttpSession session = request.getSession();
		String logged = (String)session.getAttribute("logged");
		Member logged2 = memberRepository.findByMemberid(logged);
		List<Cs> list3 = csRepository.findByHid(logged2);
		 

    	model.addAttribute("list", list);
    	model.addAttribute("list2", list2);
    	model.addAttribute("list3", list3);

		
		
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
		Cs cs = csRepository.findByCscode(cscode);
		model.addAttribute("cs", cs);
		List<Csreply> list = csReplyRepository.findAllByCscode(cs);
		model.addAttribute("list", list);
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

	@PostMapping("/chat")
    public String saveChat(@RequestParam("message") String message, HttpSession session,Model model) {

		String logged = (String) session.getAttribute("logged");
		Member logged_Hid = memberRepository.findByMemberid(logged);
		Chat chat = new Chat();
		LocalDateTime timelog = LocalDateTime.now();
		List<Chat> list = chatRepository.findAll();
		chat.setMessage(message);
		chat.setHid(logged_Hid);
		chat.setTimelog(timelog);
		
		chatRepository.save(chat);
		model.addAttribute("list", list);
		return "/";
    }

	@RequestMapping("/chatList")
	@ResponseBody
	public String chatList(Model model){
		List<Chat> list = chatRepository.findAll();
		model.addAttribute("list", list);
		System.out.println(list + "@@@@@@@@@@@@@@@============@@@@@@@");
	
		return list.toString();
	}


	@RequestMapping("/regReply")
	public String reply(@RequestParam("comment") String comment
			,@RequestParam("writermanager") String writermanager
			,@RequestParam("cscode") Long cscode
			){
		
		LocalDate localdate = LocalDate.now();
		Csreply csreply = new Csreply();
		csreply.setComment(comment);
		Member member = memberRepository.findByMemberid(writermanager);
		Cs cs = csRepository.findByCscode(cscode);

		csreply.setWritermanager(member);
		csreply.setLocaldate(localdate);
		csreply.setCscode(cs);
		csReplyRepository.save(csreply);
		
		
		return "redirect:/cs/forumDetail?cscode="+cscode;
	}



}
