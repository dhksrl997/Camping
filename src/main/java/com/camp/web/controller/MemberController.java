package com.camp.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camp.web.dao.MemberDao;
import com.camp.web.entity.Member;
import com.camp.web.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDao memberDao;

	@GetMapping("login")
	public String login() {

		return "member.login";
	}

	@GetMapping("join")
	public String join() {

		return "member.join";
	}

	@GetMapping("success")
	public String success(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userId");
		String name = memberDao.getName(userName);
		System.out.println(name);
		System.out.println(userName);
		session.setAttribute("userName", name);
		return "redirect:/index";

	}

	@PostMapping("join")
	public String join(Member member) {

		
		
		memberService.insert(member);
		
		return "redirect:/member/login";
	}


	@GetMapping("agree")
	public String agree() {

		return "member.agree";
	}
	
	//정보수정
	
	@GetMapping("editProfile")
	public String editProfile(HttpServletRequest request,Model model) {
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		List<Member> proFile = memberDao.selectProfile(userId);
		System.out.println(proFile);
		model.addAttribute("proFile", proFile);
		
		return "member.editProfile";
	}
}
