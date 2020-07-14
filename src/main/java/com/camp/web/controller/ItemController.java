package com.camp.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/items/")
public class ItemController {

	@GetMapping("campitem")
	private String campitem() {

		return "items.campitem";
	}
	
	@GetMapping("detail")
	private String detail() {

		return "items.detail";
	}

}
