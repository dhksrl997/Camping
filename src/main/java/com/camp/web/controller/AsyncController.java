package com.camp.web.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.camp.web.dao.BoardDao;
import com.camp.web.dao.CampDao;
import com.camp.web.entity.Board;
import com.camp.web.entity.Camp;

@RestController
public class AsyncController {

   @Autowired
   private CampDao campDao;
   @Autowired
   private BoardDao boarddao;

   
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
      System.out.println(query);
      System.out.println(index);
      index = ((index) * 10) + 1;
      Map<String, Object> map = new HashMap<>();
      List<Camp> list = campDao.getSearchScroll(query,index);
      
      System.out.println(list);
      map.put("searchlist", list);
      
      return map;
   }
   
//   @RequestMapping(value="/board/reg-search", method=RequestMethod.POST)
   @PostMapping("/board/reg-search")
   public Map<String, Object> regSearch(String content
		   ) throws ClassNotFoundException, SQLException {
      
	   System.out.println(content);
	   
      Map<String, Object> map = new HashMap<>();
      List<Camp> list = boarddao.getSearchResult(content);
      map.put("regSearch", list);
      
      return map;
   }
   
   
   @PostMapping("/board/reg-popup")
   public List<Camp> regPopup(String content){
	   List<Camp> list = new ArrayList<>();
	   System.out.println(content);
	   
	   list = campDao.getPopup(content);
	   System.out.println(list);
	   return list;
   };
   

@RequestMapping(value = "/board/imgs-upload", method = RequestMethod.POST)
   public String multipartUpload(HttpServletRequest request,
		  String file) 
		   throws Exception {
	MultipartHttpServletRequest mpsrequest=(MultipartHttpServletRequest)request;
//	Iterator<String> iter = files.getFileNames(); 
		System.out.println(file);
     return "redirect:/";
   }
}

