package com.camp.web.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camp.web.entity.Camp;
import com.camp.web.entity.Comment;
import com.camp.web.entity.Member;

@Mapper
public interface CampDao {

   @Select("SELECT * FROM camper Where address LIKE '%${reg}%' LIMIT 10")
   List<Camp> getList(String reg) throws ClassNotFoundException, SQLException;

   @Select("SELECT * FROM camper")
   List<Camp> recommend() throws ClassNotFoundException, SQLException;

   @Select("SELECT * FROM camper Where id=#{id}")
   List<Camp> getDetail(int id) throws ClassNotFoundException, SQLException;

   @Select("SELECT * FROM camper Where address LIKE '%${reg}%' limit 10 offset ${index}")
   List<Camp> getScroll(String reg, int index) throws ClassNotFoundException, SQLException;

   @Insert("INSERT INTO comment(campId,writer,content,pub) VALUES('${campId}','${writer}','${content}','${pub}')")
   int insertComment(Comment comment);
   
   @Select("SELECT * FROM comment Where campId=#{id} ORDER BY regDate DESC")
   List<Comment> getComment(int id) throws ClassNotFoundException, SQLException;
   
   @Select("SELECT * FROM camper Where name LIKE '%${query}%' || address LIKE '%${query}%'||phone LIKE '%${query}%' || faclity LIKE '%${query}%' LIMIT 10")
   List<Camp> search(String query) throws ClassNotFoundException, SQLException;
   
   @Select("SELECT Count(*) FROM camper Where name LIKE '%${query}%' || address LIKE '%${query}%'||phone LIKE '%${query}%' || faclity LIKE '%${query}%'")
   int getSearchIndex(String query) throws ClassNotFoundException, SQLException;
   
   @Select("SELECT * FROM camper Where name LIKE '%${query}%' || address LIKE '%${query}%'||phone LIKE '%${query}%' || faclity LIKE '%${query}%' limit 10 offset ${index}")
   List<Camp> getSearchScroll(String query, int index);

   @Select("SELECT *FROM member where uid='${userId}'")
   List<Member> getMemberInfo(String userId);
   
   @Delete("DELETE from comment where id = '${commentId}';")
   int deleteComment(String commentId);
   
   @Select("SELECT * from camper where name = '${content}'")
   List<Camp> getPopup(String content);
   

// admin
   @Select("SELECT * FROM camper LIMIT 20")
   List<Camp> list() throws ClassNotFoundException, SQLException;
   
   @Select("SELECT * FROM camper LIMIT ${index}")
   List<Camp> listNum(int index) throws ClassNotFoundException, SQLException;
   
   @Select("SELECT COUNT(*) FROM camper")
   int campIndex() throws ClassNotFoundException, SQLException;
   
   @Select("SELECT * FROM camper Where name LIKE '%${query}%' || address LIKE '%${query}%' ||phone LIKE '%${query}%'  || faclity LIKE '%${query}%'  LIMIT 20")
   List<Camp> adminSearch(String query) throws ClassNotFoundException, SQLException;

   @Select("SELECT *FROM camper where id = '${id}'")
   List<Camp> selectDetail(String id);

   @Update("UPDATE camper SET name='${name}',latitude='${latitude}', longitude='${longitude}' , address='${address}',phone = '${phone}', parking='${parking}' ,faclity='${faclity}', price='${price}' where id=${id};")
   int updateCamp(Camp camp);

   @Insert("insert into letter (send,recieve,content) values(${id} , 1 , '${content}');")
   Integer insertLetter(int id, String content);
 

  
}	
