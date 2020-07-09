package com.camp.web.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camp.web.dao.CampDao;
import com.camp.web.entity.Camp;

@Controller
@RequestMapping("/camp/")
public class CampController {

	@Autowired
	private CampDao campDao;

	@GetMapping("list")
	private String getList(@RequestParam(name = "reg",defaultValue = "") String region, Model model)
			throws ClassNotFoundException, SQLException {
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
		else if (region.equals("")||region == null) {
			Random rand =new Random();
			List<Camp> list = campDao.recommend();
			List<Camp> indexlist = new ArrayList<>();
			for(int i =0 ; i<3; i++) {
				int index=rand.nextInt(99)+1;
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
	}

	@GetMapping("item")
	private String campitem() {

		return "camp.item";
	}
	
	@GetMapping("detail")
	public String detail(@RequestParam(name = "id")int id,Model model) throws ClassNotFoundException, SQLException {
		List<Camp> list = campDao.getDetail(id);
		model.addAttribute("list", list);
		return "camp.detail";
	}

}
