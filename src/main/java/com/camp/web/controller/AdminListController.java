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

@Controller("adminlistController")
@RequestMapping("/admin/")
public class AdminListController {
	
	@Autowired
	private BoardDao boardDao;

	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private CampDao campDao;
	
	
	@GetMapping("camplist")
	private String camplist(Model model) throws ClassNotFoundException, SQLException {

		List<Camp> camplist = campDao.getList();
		model.addAttribute("camplist", camplist);
		
		return "admin.camplist";
	}
	
//	
//	@GetMapping("boardlist")
//	private String boardlist(Model model) throws ClassNotFoundException, SQLException  {
//		
//		List<Board> boardlist = boardlistDao.getBoardList();
//		model.addAttribute("boardlist", boardlist);
//		
//		return "admin.boardlist";
//	}
//	
//	
//	@GetMapping("userlist")
//	private String userlist(Model model) throws ClassNotFoundException, SQLException {
//		
//		List<Member> userlist = adminListDao.getUserList();
//		model.addAttribute("userlist", userlist);
//		
//		return "admin.userlist";
//	}

	
}
