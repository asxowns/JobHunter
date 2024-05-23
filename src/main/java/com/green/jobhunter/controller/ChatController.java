package com.green.jobhunter.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.green.jobhunter.entity.Chat;
import com.green.jobhunter.entity.Member;
import com.green.jobhunter.repository.ChatRepository;
import com.green.jobhunter.repository.MemberRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/chat")
@RestController
public class ChatController {

    @Autowired
    MemberRepository memRepo;

    @Autowired
    ChatRepository chatRepo;

    @RequestMapping("/send")
    public @ResponseBody List<Chat> saveChat(@RequestParam("msg") String msg, HttpServletRequest req) {
        HttpSession session = req.getSession();
        char role = (char) session.getAttribute("role");
		String logged = (String) session.getAttribute("logged");
		Member logged_member = memRepo.findByMemberid(logged);
        System.out.println("msg");
        System.out.println("msg");
        System.out.println("msg");
        Chat chat = new Chat();
        chat.setMessage(msg);
        chat.setHid(logged_member);
        chat.setTimelog(LocalDateTime.now());
        if(role == 'm' || role == 'M'){
            chat.setType("r");
        }
        else{
            chat.setType("s");
        }
        chatRepo.save(chat);

		List<Chat> list = chatRepo.findAllByHid(logged_member);
        System.out.println(list);
		return list;

    }


	@RequestMapping("/list")
	@ResponseBody
	public List<Chat> chatList(HttpServletRequest req){
		HttpSession session = req.getSession();
		String logged = (String) session.getAttribute("logged");
		Member logged_Hid = memRepo.findByMemberid(logged);

		List<Chat> list = chatRepo.findAllByHid(logged_Hid);
		return list;
	}
}
