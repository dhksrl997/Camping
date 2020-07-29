package com.camp.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminCamplistController")
@RequestMapping("/admin")
public class CampController {

	@GetMapping("/camplist")
	private String camplist() {

		return "admin.camplist";
	}

	
}
