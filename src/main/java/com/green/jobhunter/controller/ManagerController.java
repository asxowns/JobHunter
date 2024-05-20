package com.green.jobhunter.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.jobhunter.entity.Notice;
import com.green.jobhunter.repository.NoticeRepository;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/manage")
public class ManagerController {
    @Autowired
    private NoticeRepository noticeRepo;

    @RequestMapping("/")
    public String root(){
        return "/manage/managerPage";  
    }

    @RequestMapping("/noticeList")
    public String noticeList(Model model) {
        List<Notice> list = new ArrayList<>();
        list = noticeRepo.findAll();
        model.addAttribute("noticeList", list);
        return "/manage/noticeList";
    }
    
    @RequestMapping("/noticeDetail")
    public String noticeDetail(@RequestParam("ntcode") Long ntcode, Model model) {
        System.out.println(ntcode);
        Notice notice = noticeRepo.findByNtcode(ntcode);
        model.addAttribute("notice", notice);
        return "/manage/noticeDetail";
    }

    @RequestMapping("/noticeWriteForm")
    public void noticeWriteForm(){

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
}
