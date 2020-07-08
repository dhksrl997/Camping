package com.camp.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/items")
public class ItemController {

//	@Autowired
//	private CampDao campDao;

	@GetMapping("/checklist")
	private String campitem() {

		return "items.checklist";
	}

}
