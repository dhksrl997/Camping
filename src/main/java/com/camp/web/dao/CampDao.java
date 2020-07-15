package com.camp.web.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.web.entity.Camp;
import com.camp.web.entity.Comment;

@Mapper
public interface CampDao {

	@Select("SELECT * FROM camping2 Where address LIKE '%${reg}%' LIMIT 10")
	List<Camp> getList(String reg) throws ClassNotFoundException, SQLException;

	@Select("SELECT * FROM camping2 LIMIT 100")
	List<Camp> recommend() throws ClassNotFoundException, SQLException;

	@Select("SELECT * FROM camping2 Where id=#{id}")
	List<Camp> getDetail(int id) throws ClassNotFoundException, SQLException;

	@Select("SELECT * FROM camping2 Where address LIKE '%${reg}%' limit 10 offset ${index}")
	List<Camp> getScroll(String reg, int index) throws ClassNotFoundException, SQLException;

	@Insert("INSERT INTO comment(campId,writer,content,pub) VALUES('${campId}','${writer}','${content}','${pub}')")
	int insertComment(Comment comment);
	
	@Select("SELECT * FROM comment Where campId=#{id} ORDER BY regDate")
	List<Comment> getComment(int id) throws ClassNotFoundException, SQLException;
	
	@Select("SELECT * FROM camping2 Where name LIKE '%${query}%' || address LIKE '%${query}%'||phone LIKE '%${query}%' || faclity LIKE '%${query}%' LIMIT 10")
	List<Camp> search(String query) throws ClassNotFoundException, SQLException;
	
	@Select("SELECT Count(*) FROM camping2 Where name LIKE '%${query}%' || address LIKE '%${query}%'||phone LIKE '%${query}%' || faclity LIKE '%${query}%'")
	int getSearchIndex(String query) throws ClassNotFoundException, SQLException;
	
	@Select("SELECT * FROM camping2 Where name LIKE '%${query}%' || address LIKE '%${query}%'||phone LIKE '%${query}%' || faclity LIKE '%${query}%' limit 10 offset ${index}")
	List<Camp> getSearchScroll(String query, int index);
}
