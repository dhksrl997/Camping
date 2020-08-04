package com.camp.web.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

//	@GetMapping("/intro")
//	private String indexintro() {
//		return "intro";
//	}

	@GetMapping("/index")
	private String index(HttpServletResponse response) {
		Cookie cookie =new Cookie("view",null);
		cookie.setMaxAge(60*60*24*365);
		response.addCookie(cookie);
		return "root.index";
	}

	@GetMapping("/aboutUs")
	private String makers() {

		return "root.aboutUs";
	}
}
