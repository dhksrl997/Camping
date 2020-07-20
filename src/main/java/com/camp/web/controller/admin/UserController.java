package com.camp.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminUserlistController")
@RequestMapping("/admin")
public class UserController {

	@GetMapping("/userlist")
	private String userlist() {

		return "admin.userlist";
	}

	
}
