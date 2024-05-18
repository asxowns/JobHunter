package com.green.jobhunter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.jobhunter.entity.Cs;
import com.green.jobhunter.repository.CsRepository;

@Controller
@RequestMapping("/cs")
public class CustomerController {
	
	@Autowired
	private CsRepository csRepository;
	
    @RequestMapping("/csList")
    public String selectAll(Model model){
    	List<Cs> list = csRepository.findAll();
    	System.out.println(list);
    	model.addAttribute("list", list);
    	
        return "/cs/csList";  
    }

    
}
