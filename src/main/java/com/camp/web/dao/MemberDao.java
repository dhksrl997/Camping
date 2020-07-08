package com.camp.web.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.camp.web.entity.Member;
@Mapper
public interface MemberDao {

	@Insert("Insert into MemberTest(uid,pwd,name) values ('${uid}', '${pwd}', '${name}' );")
	int insert(Member member);
	
	

}
