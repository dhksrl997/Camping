package com.camp.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.camp.web.dao.BoardDao;
import com.camp.web.dao.CampDao;
import com.camp.web.dao.MemberDao;
import com.camp.web.entity.Board;
import com.camp.web.entity.Camp;
import com.camp.web.entity.Member;

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
		List<Camp> list = campDao.getSearchScroll(query, index);

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

//	****************************************************

	@Autowired
	private MemberDao memberDao;

	@PostMapping("/admin/userlistSelect")
	public Map<String, Object> userlist(int index, @RequestParam(name = "query", defaultValue = "") String query)
			throws ClassNotFoundException, SQLException {
		Map<String, Object> map = new HashMap<>();
		List<Member> userlist = memberDao.userlistNum(index);
		map.put("userlistSelect", userlist);

		return map;
	}

//	****************************************************

	@Autowired
	private BoardDao boardDao;

	@PostMapping("/admin/boardlistSelect")
	public Map<String, Object> boardlist(int index, @RequestParam(name = "query", defaultValue = "") String query)
			throws ClassNotFoundException, SQLException {
		Map<String, Object> map = new HashMap<>();
		List<Board> boardlist = boardDao.boardListNum(index);
		map.put("boardlistSelect", boardlist);

		return map;
	}

	
	@PostMapping("/board/reg-search")
	public Map<String, Object> regSearch(String content) throws ClassNotFoundException, SQLException {


		Map<String, Object> map = new HashMap<>();
		List<Camp> list = boardDao.getSearchResult(content);
		map.put("regSearch", list);

		return map;
	}

	@PostMapping("/board/reg-popup")
	public List<Camp> regPopup(String content) {
		List<Camp> list = new ArrayList<>();

		list = campDao.getPopup(content);
		return list;
	}
	
	@PostMapping("/uploadImgs")
	public String[] ImgUpload(HttpServletResponse resp ,HttpServletRequest request, @RequestParam(name = "img") MultipartFile[] file)
			throws IOException {		
		request.setCharacterEncoding("UTF-8");
		int index = 0;
//		String filename = URLDecoder.decode( request.getParameter( "img" ), "UTF-8" );
		String[] filenames = new String[file.length];
		for (MultipartFile files : file) {
			File targetFile = new File("./src/main/resources/static/upload/" + files.getOriginalFilename());
			filenames[index] = files.getOriginalFilename();
			index++;
			try {
				InputStream fileStream = files.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);
				e.printStackTrace();
			}
		}
		for(int i = 0; i<filenames.length; i++) {
		}
		return filenames;
	}
	

}
