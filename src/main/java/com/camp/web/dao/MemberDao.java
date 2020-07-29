package com.camp.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camp.web.entity.Member;
@Mapper
public interface MemberDao {

	@Insert("Insert into member(uid,pwd,name,phone) values ('${uid}', '${pwd}', '${name}' ,'${phone}');")
	int insert(Member member);
	
	@Select("select name from member where uid ='${userName}'")
	String selectName(String userName);

	@Select("SELECT count(*) from member Where uid='${userId}'")
	int userIdCheck(String userId); 

	@Select("select *from member where uid = '${userId}';")
	List<Member> selectProfile(String userId);

	@Update("update member set name='${name}' where uid='${userId}';")
	int updateName(String name,String userId);

	
	@Update("update member set pwd='${encodePwd}', modifiDate = CURRENT_TIMESTAMP where uid='${userId}' ;")
	int updatePwd(String encodePwd , String userId);

	@Update("update member set phone='${phone}'  where uid='${userId}' ;")
	int updatePhone(String phone, String userId);

	
	
	
	
}
