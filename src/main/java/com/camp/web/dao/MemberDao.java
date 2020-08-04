package com.camp.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camp.web.entity.GetSenderName;
import com.camp.web.entity.Letter;
import com.camp.web.entity.Member;

@Mapper
public interface MemberDao {

	@Insert("Insert into member(uid,pwd,name,phone) values ('${uid}', '${pwd}', '${name}' ,'${phone}');")
	int insert(Member member);
	
	@Select("select name from member where uid ='${userName}'")
	String selectName(String userName);

	@Update("update member set name='${name}' where uid='${userId}';")
	int updateName(String name,String userId);

	
	@Update("update member set pwd='${encodePwd}', modifiDate = CURRENT_TIMESTAMP where uid='${userId}' ;")
	int updatePwd(String encodePwd , String userId);

	@Update("update member set phone='${phone}'  where uid='${userId}' ;")
	int updatePhone(String phone, String userId);

	
	
	
	
	String getName(String userName);

	@Select("SELECT count(*) from member Where uid='${userId}'")
	int userIdCheck(String userId);

	@Select("select * from member where uid = '${userId}';")
	List<Member> selectProfile(String userId);	
	
	
	@Select("select * from member")
	List<Member> getMemberList();	
	
	@Select("select COUNT(*) from member")
	int memberIndex();	
	
	
//	admin
	@Select("select * from member LIMIT 20")
	List<Member> memberList();	
	
	@Select("SELECT * FROM member LIMIT ${index}")
	List<Member> userlistNum(int index);
	   
	@Select("SELECT * FROM member Where uid LIKE '%${query}%' || name LIKE '%${query}%' ||phone LIKE '%${query}%'  || modifiDate LIKE '%${query}%' LIMIT 20")
    List<Member> userSearch(String query);
	
	@Select("SELECT COUNT(*) FROM member Where uid LIKE '%${query}%' || name LIKE '%${query}%' ||phone LIKE '%${query}%'  || modifiDate LIKE '%${query}%' LIMIT 20")
    int userSearchIndex(String query);

	@Select("SELECT id from member where uid = '${userName}';")
	int getId(String userName);
	
	@Select("SELECT * FROM letter where recieve=${SessionId}")
	List<Letter> getLetter(int SessionId); 
	
	@Select("SELECT l.id,m.name,l.recieve,l.content,l.sendData as sendData,l.isRead FROM `member` m LEFT JOIN letter l on m.id=l.send where l.recieve=${recieverId} ORDER BY sendData DESC; ")
	List<GetSenderName> whoSendMe(int recieverId);
	
	@Select("SELECT l.id,m.name,l.recieve,l.content,l.sendData as sendData,l.isRead FROM `member` m LEFT JOIN letter l on m.id=l.send where l.send=${testId} ORDER BY sendData DESC; ")
	List<GetSenderName> whoRecieve(int testId);
	
	@Select("SELECT id FROM member where name='${userName}'")
	int getUserNum(String userName);

	@Select("SELECT Count(*) FROM letter Where isRead=1 AND recieve=${id}")
	int isRead(int id);
	
	@Update("UPDATE letter SET isRead=0 Where id=${id}")
	int read(int id);
	
	@Select("SELECT m.id,m.name name,l.recieve,l.content,l.sendData,l.isRead FROM `member` m LEFT JOIN letter l on m.id=l.send where l.id=${id}")
	List<GetSenderName> letterDetail(int id);

	@Insert("insert into letter (send,recieve,content) values (${send},${recieve},'${content}');")
	int insertResponseLetter(int send, int recieve, String content);

	@Select("SELECT Count(*) FROM letter Where isRead=1 AND recieve=${id}")
	int isReadCheck(int id);

	
	
}
