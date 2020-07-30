package com.camp.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camp.web.dao.BoardDao;
import com.camp.web.entity.Board;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 100 * 1024 * 1024, maxRequestSize = 300 * 1024 * 1024)

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Autowired
	private BoardDao boarddao;
	
	@GetMapping("list")
	public String list(@RequestParam(name = "index",defaultValue = "1") int index, Model model,
			@RequestParam(name = "cate") String category) throws ClassNotFoundException, SQLException {
		List<Board> list = boarddao.getBoard(category, index);
		model.addAttribute("content", list);
		return "board.list";
	}

	@GetMapping("reg")
	public String reg(HttpServletRequest request,HttpSession session,Model model)
			throws ClassNotFoundException, SQLException, IOException, ServletException {
		String writer = (String) session.getAttribute("userId");
		model.addAttribute("uid", writer);
		
		return "board.reg";
	}

	@PostMapping("reg")
	public String regData(@RequestParam(name = "cate")String category,String title, String content,
			HttpSession session, Model model) throws IOException, ServletException {

		String writer = (String) session.getAttribute("userId");
		boarddao.insertBoard(writer, title, content);
		return "detail?cate"+category+"&id=";
	}

	@GetMapping("detail")
	public String detail(@CookieValue(name = "view") String cookie, HttpServletResponse response,
			@RequestParam(name = "cate") String category, @RequestParam(name = "id") int id, Model model)
			throws ClassNotFoundException, SQLException {
		if (!(cookie.contains(String.valueOf(id)))) {
			cookie += id + "/";
			boarddao.hit(category, id);
		}
		response.addCookie(new Cookie("freeBoard", cookie));
		List<Board> result = boarddao.getDetail(category, id);
		model.addAttribute("result", result);
		return "board.detail";
	}


}