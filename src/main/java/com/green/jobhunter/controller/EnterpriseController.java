package com.green.jobhunter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/enter")
public class EnterpriseController {
    @RequestMapping("/")
    public String root(){
        return "home";  
    }

    
}
