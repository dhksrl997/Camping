//package com.camp.web.controller;
//
//import java.sql.SQLException;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.camp.web.dao.CampDao;
//import com.camp.web.entity.Camp;
//
//@Controller
//@RequestMapping(value = { "/*", "/*/*", "/*/*" })
//public class SearchController {
//	@Autowired
//	CampDao campDao;
//
//	@GetMapping("query")
//	public String searchResult(@RequestParam(name = "query") String query,Model model) throws ClassNotFoundException, SQLException {
//		List<Camp> list = campDao.search(query);
//		model.addAttribute("result", list);
//		return "camp.list?query="+query;
//	}
//	
//}
