package com.camp.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminBoardlistController")
@RequestMapping("/admin")
public class BoardController {

	@GetMapping("/boardlist")
	private String boardlist() {

		return "admin.boardlist";
	}

	
}
