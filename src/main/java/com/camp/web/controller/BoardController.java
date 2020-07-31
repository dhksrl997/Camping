package com.camp.web.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camp.web.dao.BoardDao;
import com.camp.web.entity.Board;
import com.camp.web.service.BoardService;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 100 * 1024 * 1024, maxRequestSize = 300 * 1024 * 1024)

@Controller
@RequestMapping("/board/")
public class BoardController {
   @Autowired
   private BoardDao boardDao;
   
   @Autowired
   private BoardService boardService;

   @GetMapping("list")
   public String list(@RequestParam(name = "index", defaultValue = "1") int index, Model model,
         @RequestParam(name = "cate") String category) {
	   int selectCount = boardService.selectBoardCount(index);
		int pageCount = ((selectCount-1) / 10)+1; //페이지 총개수
		int startPage = 1;
		int finishPage = 5;
		int lastPage=5;
		if(index>=4) {
			startPage = startPage+index-3;
			finishPage = finishPage+index-3;
			lastPage = Math.min(pageCount, finishPage);
		}
		else {
			lastPage = Math.min(finishPage, pageCount);
		}
		model.addAttribute("page" , index);
		model.addAttribute("startPage" , startPage);
		model.addAttribute("lastPage" , lastPage);
		model.addAttribute("finishPage" , finishPage);
		
		List<Board> boardList = boardService.selectBoardList(index,category);
		System.out.println(boardList); 
		model.addAttribute("boardList" , boardList);
		
//      index = 0;
//      List<Board> list = boardDao.getBoard(category, index);
//      model.addAttribute("content", list);
      return "board.list";
   }

   @GetMapping("reg")
   public String reg(HttpServletRequest request, HttpSession session, Model model,
         @RequestParam(name = "cate") String category)
         throws ClassNotFoundException, SQLException, IOException, ServletException {
      String writer = (String) session.getAttribute("userId");
      model.addAttribute("uid", writer);
      return "board.reg";
   }

   @PostMapping("reg-data")
   @ResponseBody
   public Integer regData(HttpServletRequest request, @RequestParam(name = "cate") String category, String title, String content,
         HttpSession session, Model model) throws IOException, ServletException {
      System.out.println("---------------------");   
      String writer = (String) session.getAttribute("userId");
      boardDao.insertBoard(writer, title, content);
      return boardDao.getMaxId(category);
   }

   @GetMapping("detail")
   public String detail(@CookieValue(name = "view") String cookie, HttpServletResponse response,
         @RequestParam(name = "cate") String category, @RequestParam(name = "id") int id, Model model)
         throws ClassNotFoundException, SQLException {
      if (!(cookie.contains(String.valueOf(id)))) {
         cookie += id + "/";
         boardDao.hit(category, id);
      }
      System.out.println("detail: " + category);
      System.out.println("detail: " + id);
      response.addCookie(new Cookie("freeBoard", cookie));
      List<Board> result = boardDao.getDetail(category, id);
      model.addAttribute("result", result);
      return "board.detail";
   }

}