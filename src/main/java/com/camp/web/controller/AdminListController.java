package com.camp.web.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camp.web.dao.BoardDao;
import com.camp.web.dao.CampDao;
import com.camp.web.dao.MemberDao;
import com.camp.web.entity.Board;
import com.camp.web.entity.Camp;
import com.camp.web.entity.Member;

@Controller
@RequestMapping("/admin/")
public class AdminListController {

	@Autowired
	private CampDao campDao;

	@GetMapping("camplist")
	private String camplist(Model model) throws ClassNotFoundException, SQLException {
		List<Camp> list = campDao.list();
		int index = campDao.campIndex();
		model.addAttribute("camplist", list);
		model.addAttribute("index", index);
		return "admin.camplist";
	}

	@PostMapping("camplist")
	private String camplist(Model model, @RequestParam(name = "search") String search)
			throws ClassNotFoundException, SQLException {
		List<Camp> list = campDao.adminSearch(search);
		int index = campDao.getSearchIndex(search);
		model.addAttribute("camplist", list);
		model.addAttribute("index", index);
		model.addAttribute("exist", "exist");
		return "admin.camplist";
	}
	
	@GetMapping("reg")
	private String reg() {
		
		return "admin.reg";
	}
	
	
	@Autowired	
	private MemberDao memberDao;

	@GetMapping("userlist")
	private String userlist(Model model) throws ClassNotFoundException, SQLException {

		List<Member> userlist = memberDao.memberList();
		int index = memberDao.memberIndex();
		model.addAttribute("userlist", userlist);
		model.addAttribute("index", index);

		return "admin.userlist";
	}
	
	@PostMapping("userlist")
	private String userlist(Model model, @RequestParam(name="search") String search) 
			throws ClassNotFoundException, SQLException {

		List<Member> userlist = memberDao.userSearch(search);
		int index = memberDao.userSearchIndex(search);
		model.addAttribute("userlist", userlist);
		model.addAttribute("index", index);

		return "admin.userlist";
	}
	
	
	@Autowired
	private BoardDao boardDao;

	@GetMapping("boardlist")
	private String boardlist(Model model) throws ClassNotFoundException, SQLException {

		List<Board> boardlist = boardDao.boardList();
		int index = boardDao.boardListIndex();
		model.addAttribute("boardlist", boardlist);
		model.addAttribute("index", index);
		model.addAttribute("exist", "exist");
		
		return "admin.boardlist";
	}
	
	
	
	@GetMapping("boardreg")
	private String boardreg() {
		
		return "admin.boardreg";
	}
	
	
	@GetMapping("customerCenter")
	public String customerCenter() {

		return "admin.customerCenter";
	}
	

}
