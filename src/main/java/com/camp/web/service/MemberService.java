package com.camp.web.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.camp.web.dao.MemberDao;
import com.camp.web.entity.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	public void insert(Member member) {
	
		String pwd = member.getPwd();
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		member.setPwd(encoder.encode(pwd));
		
		
		memberDao.insert(member);
	}

	public String getName(String userName, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String name = memberDao.selectName(userName);
//		System.out.printf("name : %s\n" ,name);
//		System.out.printf("userName : %s\n" , userName);
		session.setAttribute("userName", name);
		return null;
	}
	


	


}
