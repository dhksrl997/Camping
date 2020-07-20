//package com.camp.web.dao;
//
//import java.sql.SQLException;
//import java.util.List;
//
//import org.apache.ibatis.annotations.Insert;
//import org.apache.ibatis.annotations.Mapper;
//import org.apache.ibatis.annotations.Select;
//
//import com.camp.web.entity.Camp;
//import com.camp.web.entity.Comment;
//import com.camp.web.entity.Member;
//
//@Mapper
//public interface AdminListDao {
//
//
//   @Select("SELECT * FROM camper LIMIT 20")
//   List<Camp> getCampList() throws ClassNotFoundException, SQLException;
//
//   @Select("SELECT * FROM freeBoard LIMIT 20")
//   //List<Board> getBoardList() throws ClassNotFoundException, SQLException;
//
//   @Select("SELECT * FROM member LIMIT 20")
//   List<Member> getUserList() throws ClassNotFoundException, SQLException;
//
//}
