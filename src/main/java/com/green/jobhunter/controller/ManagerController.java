package com.green.jobhunter.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.jobhunter.entity.Notice;
import com.green.jobhunter.repository.MemberRepository;
import com.green.jobhunter.repository.NoticeRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/manage")
public class ManagerController {
    @Autowired
    private NoticeRepository noticeRepo;

    @Autowired
    private MemberRepository memberRepo;

    @RequestMapping("/")
    public String root(HttpServletRequest req,Model model){
        String view = "/manage/managerPage";
        HttpSession session = req.getSession();
        String logged = (String) session.getAttribute("logged");
        if(logged == null){
            view = "redirect:/";
        }else{
            char role = memberRepo.findByMemId(logged).getRole();
            model.addAttribute("role",role);
        }
        return view;  
    }

    @RequestMapping("/noticeList")
    public String noticeList(Model model) {
        List<Notice> list = new ArrayList<>();
        list = noticeRepo.findAll();
        model.addAttribute("noticeList", list);
        return "/manage/noticeList";
    }
    
    @RequestMapping("/noticeDetail")
    public String noticeDetail(HttpServletRequest req, @RequestParam("ntcode") Long ntcode, Model model) {
        String view = "/manage/noticeDetail";
        HttpSession session = req.getSession();
        String logged = (String) session.getAttribute("logged");
        if(logged == null){
            view = "/main/loginForm";
        }else{
            char logged_role = memberRepo.findByMemberid(logged).getRole();
            model.addAttribute("logged_role", String.valueOf(logged_role));
        }
        Notice notice = noticeRepo.findByNtcode(ntcode);
        model.addAttribute("notice", notice);

        return view;
    }

    @RequestMapping("/noticeUpdateForm")
    public String noticeUpdateForm(@RequestParam("ntcode") Long ntcode, Model model){
        Notice notice = noticeRepo.findByNtcode(ntcode);
        model.addAttribute("notice", notice);
        model.addAttribute("type", "수정");
        return "/manage/noticeWriteForm";
    }

    @RequestMapping("/noticeWriteForm")
    public void noticeWriteForm(){

    }

    @RequestMapping("/noticeUpdate")
    public String noticeUpdate(@RequestParam("ntcode")Long ntcode, HttpServletRequest req){
        Notice notice = noticeRepo.findByNtcode(ntcode);
        notice.setTitle(req.getParameter("title"));
        notice.setContent(req.getParameter("content"));
        noticeRepo.save(notice);    
        return "redirect:/manage/noticeList";
    }

    @RequestMapping("/noticeWrite")
    public String noticeWrite(HttpServletRequest req){
        Notice notice = new Notice();
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        notice.setContent(content);
        notice.setTitle(title);
        // notice.setRegdate(Date.now());
        noticeRepo.save(notice);
        return "redirect:/manage/noticeList";
    }

    @RequestMapping("/noticeDelete")
    public String noticeDelete(@RequestParam("ntcode") Long ntcode){

        noticeRepo.deleteById(ntcode);
        
        return "redirect:/manage/noticeList";
    }
}
