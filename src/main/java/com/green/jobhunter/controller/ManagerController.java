package com.green.jobhunter.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.jobhunter.entity.Member;
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

    @RequestMapping("/manageLoginForm")
    public String manageLoginForm(HttpSession session) {
        String view="/manage/manageLoginForm";
        String logged_id = (String)session.getAttribute("logged");
        if(logged_id != null){
            Member loggedMember = memberRepo.findByMemId(logged_id);
            if(loggedMember.getRole() == 'm' || loggedMember.getRole() == 'M'){
                view = "/manage/managerPage";
            }
        }
        
        return view;
    }

    @RequestMapping("/manageLogin")
    public String manageLogin(HttpServletRequest req) {
        String view = "redirect:/manage/";
        String id = req.getParameter("id");
        String pwd = req.getParameter("pwd");
        if (id == null || pwd == null) {
            view = "/manage/manageLoginForm";
        } else {
            Member manager = memberRepo.findByMem(id, pwd);
            if (manager != null) {
                char role = manager.getRole();
                if (role == 'm' || role == 'M') {
                    HttpSession session = req.getSession();
                    session.setAttribute("logged", id);
                    session.setAttribute("role",role);
                    view = "/manage/managerPage";
                } else {
                    view = "redirect:/";
                }
            }else{
                view = "redirect:/";
            }
        }
        return view;
    }
    
    @RequestMapping("/")
    public String root(HttpServletRequest req, Model model) {
        String view = "/manage/managerPage";
        HttpSession session = req.getSession();
        String logged = (String) session.getAttribute("logged");
        if (logged == null) {
            view = "redirect:/";
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
        if (logged == null) {
            view = "/main/loginForm";
        } else {
            char logged_role = memberRepo.findByMemberid(logged).getRole();
            model.addAttribute("logged_role", String.valueOf(logged_role));
        }
        Notice notice = noticeRepo.findByNtcode(ntcode);
        model.addAttribute("notice", notice);

        return view;
    }

    @RequestMapping("/noticeUpdateForm")
    public String noticeUpdateForm(@RequestParam("ntcode") Long ntcode, Model model) {
        Notice notice = noticeRepo.findByNtcode(ntcode);
        model.addAttribute("notice", notice);
        model.addAttribute("type", "수정");
        return "/manage/noticeWriteForm";
    }

    @RequestMapping("/noticeWriteForm")
    public void noticeWriteForm() {

    }

    @RequestMapping("/noticeUpdate")
    public String noticeUpdate(@RequestParam("ntcode") Long ntcode, HttpServletRequest req) {
        Notice notice = noticeRepo.findByNtcode(ntcode);
        notice.setTitle(req.getParameter("title"));
        notice.setContent(req.getParameter("content"));
        noticeRepo.save(notice);
        return "redirect:/manage/noticeList";
    }

    @RequestMapping("/noticeWrite")
    public String noticeWrite(HttpServletRequest req) {
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
    public String noticeDelete(@RequestParam("ntcode") Long ntcode) {

        noticeRepo.deleteById(ntcode);

        return "redirect:/manage/noticeList";
    }


    @RequestMapping("/accessHub")
    public String accessHub(HttpServletRequest req, Model model){
        String searchId = req.getParameter("searchId");
        List<Member> members = null;
        if(searchId != null){
            members = memberRepo.searchByMemberid(searchId);
        }
        else{
            members = memberRepo.findAll();
        }
        model.addAttribute("members", members);
        return "/manage/accessHub";
    }

    @RequestMapping("/updateRole")
    public String updateRole(@RequestParam String memberId, @RequestParam String action) {
        Member member = memberRepo.findById(memberId).orElse(null);
        if (member != null) {
            switch (action) {
                case "grant":
                    member.setRole('m'); // 권한 부여
                    break;
                case "delete":
                    member.setRole('h');
                    break;
            }
            memberRepo.save(member);
        }
        return "redirect:/manage/accessHub";
    }

    @RequestMapping("/managerCSList")
    public String managerCSList(){

        return "/manage/managerCSList";
    }
    @RequestMapping("/managerCSDetail")
    public String managerCSDetail(){
        return "/manage/managerCSDetail";
    }

    @RequestMapping("/chat")
    public String chat(){

        return "/manage/chatInquiryList";
    }

    @RequestMapping("/chatDetail")
    public String chatDetail(){
        return "/manage/chatDetail";
    }

    @RequestMapping("/managerDashBoard")
    public void managerDashBoard(){

    }


    
}
