package com.atguigu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	
	@RequestMapping("/index")
	public String goto_manager_index(String url,String title,Model map) {
		map.addAttribute("url", url);
		map.addAttribute("title", title);
		
		return "manager_index";
	}
	
}
