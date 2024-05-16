package com.green.jobhunter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
    @RequestMapping("/")
    public String root(){
        return "home";  
    }

    
}
