package com.green.jobhunter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    @RequestMapping("/")
    public String root(){
        return "./main/postList";  
    }
    @RequestMapping("/registForm")
    public String regForm(){
        return "./main/registForm";  
    }
    
    
    
}
