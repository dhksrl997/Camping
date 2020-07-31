package com.camp.web.controller;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camp.web.dao.CampDao;
import com.camp.web.dao.MemberDao;
import com.camp.web.entity.Camp;
import com.camp.web.entity.Comment;
import com.camp.web.entity.Member;

@Controller
@RequestMapping("/camp/")
public class CampController {

	@Autowired
	private CampDao campDao;
	
	

	@GetMapping("list")
	private String getList(@RequestParam(name = "reg", defaultValue = "") String region, Model model, String query)
			throws ClassNotFoundException, SQLException {
		if (query == null) {
			if (region.equals("se"))
				region = "서울";
			else if (region.equals("gg"))
				region = "경기";
			else if (region.equals("kw"))
				region = "강원";
			else if (region.equals("gs"))
				region = "경상";
			else if (region.equals("jl"))
				region = "전라";
			else if (region.equals("cc"))
				region = "충청";
			else if (region.equals("jj"))
				region = "제주";
			else if (region.equals("") || region == null) {
				Random rand = new Random();
				List<Camp> list = campDao.recommend();
				List<Camp> indexlist = new ArrayList<>();
				for (int i = 0; i < 3; i++) {
					int index = rand.nextInt(list.size()) + 1;
					indexlist.add(list.get(index));
				}
				model.addAttribute("recommend", indexlist);
				return "camp.list";
			}

			if (!(region.equals(""))) {
				List<Camp> list = campDao.getList(region);
				model.addAttribute("list", list);
			}
			return "camp.list";
		} else {
			List<Camp> result = campDao.search(query);
			int index = campDao.getSearchIndex(query);
			model.addAttribute("result", result);
			model.addAttribute("index", index);
			return "camp.list";
		}
	}

	@GetMapping("item")
	private String campitem() {

		return "camp.item";
	}

	@GetMapping("detail")
	public String detail(@RequestParam(name = "id") int id, Model model , HttpServletRequest request) throws ClassNotFoundException, SQLException {
		List<Camp> list = campDao.getDetail(id);
		List<Comment> cmt = new ArrayList<>();
		cmt = campDao.getComment(id);
		model.addAttribute("list", list);
		model.addAttribute("getComment", cmt);
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		List<Member> memberList = campDao.getMemberInfo(userId);
		model.addAttribute("memberList" , memberList);
		
		
		return "camp.detail";
	}

	@PostMapping("detail")
	public void regComment(@RequestParam(name = "id") int campId, String writer,
			@RequestParam(name = "content") String content, String pub, Model model, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userId");
		if (userName != null) {
			writer = userName;
			if (pub == null)
				pub = "off";
			Comment comment = new Comment(campId, writer, content, pub);
			campDao.insertComment(comment);
			response.sendRedirect("detail?id=" + campId);
		} else 
			response.sendRedirect("/member/login");
	}
	
	//댓글삭제

	@GetMapping("detail/delete")
	@ResponseBody
	public int deletComment(@RequestParam("commentId") String commentId) {

		System.out.println(commentId);
		return campDao.deleteComment(commentId);
	}

}
