package com.camp.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camp.web.dao.MemberDao;

@Controller
public class IdCheckController {
	@Autowired
	private MemberDao memberDao;

	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) {

		return memberDao.userIdCheck(userId);
	}
}
