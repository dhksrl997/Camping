package com.camp.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/camp/")
public class CampController {

	@GetMapping("list")
	private String indexintro() {

		return "camp.list";
	}


}
