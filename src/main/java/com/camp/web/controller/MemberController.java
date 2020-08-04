package com.camp.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camp.web.dao.MemberDao;
import com.camp.web.entity.GetSenderName;
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
		System.out.println(userName);
		String name = memberService.getName(userName, request);
		// id저장
		int id = memberDao.getId(userName);
		session.setAttribute("id", id);

		String readCount = memberDao.isRead(id);

		session.setAttribute("isRead", readCount);

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

	// 정보수정

	@GetMapping("editProfile")
	public String editProfile(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		List<Member> proFile = memberDao.selectProfile(userId);
		System.out.println(proFile);
		model.addAttribute("proFile", proFile);

		return "member.editProfile";
	}

	// 이름 업데이트

	@GetMapping("editProfile/update")
	@ResponseBody
	public int updateName(@RequestParam("name") String name, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		session.setAttribute("userName", name);
		return memberDao.updateName(name, userId);
	}

	// 비밀번호 업데이트
	@GetMapping("editProfile/update/pwd")
	@ResponseBody
	public int updatePwd(@RequestParam("pwd") String pwd, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		PasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodePwd = encoder.encode(pwd);

		return memberDao.updatePwd(encodePwd, userId);
	}

	// 폰번호 업데이트
	@GetMapping("editProfile/update/phone")
	@ResponseBody
	public int updatePhone(@RequestParam("phone") String phone, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		return memberDao.updatePhone(phone, userId);
	}

	@GetMapping("letters")
	public String getLetters(Model model, HttpSession session) {
		System.out.println(session.getAttribute("userName"));
		int id = (int) session.getAttribute("id");
		List<GetSenderName> senderName = memberDao.whoSendMe(id);
		model.addAttribute("SenderName", senderName);
		List<GetSenderName> recieve = memberDao.whoRecieve(id);
		model.addAttribute("recieve", recieve);

		return "member.letters";
	}

	// letter detail
	@GetMapping("readLetter")
	public String readLetter(@RequestParam(name = "id") int id, Model model, HttpServletRequest request,
			@RequestParam(name = "status", required = false) String status) {
		memberDao.read(id);
		HttpSession session = request.getSession();
		String readCount = memberDao.isRead(id);

		if (readCount == null) {
			session.setAttribute("isRead", readCount);
		}
		if (status != null) {
			model.addAttribute("status", status);
		}
		model.addAttribute("content", memberDao.letterDetail(id));
		System.out.println(memberDao.letterDetail(id));
		return "member.readLetter";
	}

	// 답장

	@GetMapping("responseLetter")
	public String response(@RequestParam(name = "id", required = true) int sendId, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		int loginId = (int) session.getAttribute("id");
		model.addAttribute("sendId", sendId);
		model.addAttribute("loginId", loginId);
		return "member.responseLetter";

	}

	@PostMapping("responseLetter-data")
	@ResponseBody
	public int insertResponseLetter(HttpServletRequest request, int send, int recieve, String content) {
		return memberDao.insertResponseLetter(send, recieve, content);
	}

	@PostMapping("isReadCheck")
	@ResponseBody
	public String check(HttpSession session) {
		String result = memberDao.isRead((int) session.getAttribute("id"));
		if (result != null) {
			result = memberDao.isRead((int) session.getAttribute("id"));
			return result;
		} else
			return null;
	}

}
