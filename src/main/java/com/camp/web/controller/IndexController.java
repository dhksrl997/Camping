package com.camp.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping("/introindex")
	private String indexintro() {
		
		
		return "introindex";
}
	
	@GetMapping("/index")
	private String index() {
		
		
		return "root.index";
}
}





	
