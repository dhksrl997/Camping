package com.camp.web.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		List<Camp> camplist = campDao.List();
		int index= campDao.campIndex();
		model.addAttribute("camplist", camplist);
		model.addAttribute("index", index);
		
		return "admin.camplist";
	}

	
	
	@Autowired
	private BoardDao boardDao;
	
	@GetMapping("boardlist")
	private String boardlist(Model model) throws ClassNotFoundException, SQLException  {
		
		List<Board> boardlist = boardDao.getBoardList();
		int index= boardDao.boardindex();
		model.addAttribute("boardlist", boardlist);
		model.addAttribute("index", index);
		
		return "admin.boardlist";
	}
	
	
	
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("userlist")
	private String userlist(Model model) throws ClassNotFoundException, SQLException {
		
		List<Member> userlist = memberDao.getMemberList();
		int index = memberDao.memberIndex();
		model.addAttribute("userlist", userlist);
		model.addAttribute("index", index);
		
		return "admin.userlist";
	}

}
