package com.green.jobhunter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hunter")
public class HunterController {
    @RequestMapping("/")
    public String root(){
        return "/home";  
    }

    @RequestMapping("/hunterpage")
    public String goHunterPage(){
        return "/hunter/hunterPage";  
    }
    
    @RequestMapping("/resumeWriteForm")
    public String writeResume() {
    	
    	return "/hunter/resumeWriteForm";
    }
}
