package com.camp.web.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.tags.form.PasswordInputTag;

import com.camp.web.dao.MemberDao;
import com.camp.web.entity.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	public void insert(Member member) {
	
//		String pwd = member.getPwd();
//		PasswordEncoder encoder = new BCryptPasswordEncoder();
//		member.setPwd(encoder.encode(pwd));
		
		
		memberDao.insert(member);
	}


}
