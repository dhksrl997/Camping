package com.camp.web.service;

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


}
