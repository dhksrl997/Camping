package com.camp.web.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camp.web.dao.BoardDao;
import com.camp.web.entity.Board;

@Controller
@RequestMapping("/board/")
public class BoardController {

	@Autowired
	private BoardDao boardDao;

	@GetMapping("list")
	public String list(String title, String content, String writer, Model model,
			@RequestParam(name = "cate") String category) throws ClassNotFoundException, SQLException {
		if (category.equals("review")) {  //review 게시판 불러옴 
			List<Board> list = boardDao.getBoard(writer, title, content);
			model.addAttribute("content", list);
		} else if (category.equals("free")) {//자유 게시판 불러옴 
			List<Board> list = boardDao.getBoard(writer, title, content);
			model.addAttribute("content", list);
		}
		return "board.list";
	}

	@GetMapping("reg")
	public String reg() throws ClassNotFoundException, SQLException {

		return "board.reg";
	}

	@PostMapping("reg")
	public void regData(HttpServletResponse response, HttpServletRequest request, String title, String content,
			HttpSession session, Model model) throws IOException {

		String writer = (String) session.getAttribute("userId");
//		System.out.println(writer);
		boardDao.insertBoard(writer, title, content);

		System.out.println("title =" + title);
		System.out.println("content = " + content);
		System.out.println("userId = " + writer);
//		response.sendRedirect("/board/list");

//		return "board.list";

	}

}
