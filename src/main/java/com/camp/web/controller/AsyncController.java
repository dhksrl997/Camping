package com.camp.web.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.camp.web.dao.CampDao;
import com.camp.web.entity.Camp;

@RestController
public class AsyncController {

   @Autowired
   private CampDao campDao;

   @RequestMapping("/camp/getlist")
   public Map<String, Object> list(@RequestParam(name = "index", defaultValue = "1") int index,
         @RequestParam(name = "reg", defaultValue = "") String region, Model model)
         throws ClassNotFoundException, SQLException {
      Map<String, Object> map = new HashMap<>();

      index = ((index) * 10) + 1;
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
      else if (region.equals(""))
         region = null;

      if (region != null) {
//            List<Camp> list = campDao.getList(region);
//            System.out.println(index);
         List<Camp> list = campDao.getScroll(region, index);
         map.put("lists", list);

      }
      return map;

   }

   @RequestMapping("/camp/reclist")
   public Map<String, Object> recList() throws ClassNotFoundException, SQLException {
      Map<String, Object> map = new HashMap<>();
      Random rand = new Random();
      List<Camp> list = campDao.recommend();
      List<Camp> indexlist = new ArrayList<>();
      for (int i = 0; i < 3; i++) {
         int index = rand.nextInt(99) + 1;
         indexlist.add(list.get(index));
      }
      map.put("reclist", indexlist);
      return map;
   }
   
   @RequestMapping("/camp/searchlist")
   public Map<String, Object> searchList(@RequestParam(name = "index", defaultValue = "1") int index,
         @RequestParam(name = "query", defaultValue = "") String query) throws ClassNotFoundException, SQLException {
      index = ((index) * 10) + 1;
      Map<String, Object> map = new HashMap<>();
      List<Camp> list = campDao.getSearchScroll(query,index);
      map.put("searchlist", list);
      
      return map;
   }
   
   
   @PostMapping("/admin/listSelect")
	public Map<String, Object> list(int index, @RequestParam(name = "query", defaultValue = "") String query)
			throws ClassNotFoundException, SQLException {
		Map<String, Object> map = new HashMap<>();
		List<Camp> list = campDao.listNum(index);
		map.put("listSelect", list);

		return map;
	}
   
   
   

}