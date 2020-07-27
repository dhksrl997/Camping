package com.camp.web.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.web.entity.Board;
import com.camp.web.entity.Camp;
import com.camp.web.entity.Member;

@Mapper
public interface BoardDao {
	@Insert("INSERT INTO free (title,content,writer) VALUES('${title}','${content}','${writer}')")
	int insertBoard(String writer, String title, String content);

	@Select("SELECT * FROM free")
	List<Board> getBoard(String writer, String title, String content);

	@Select("SELECT * FROM free")
	List<Board> getBoardList();
	
	@Select("SELECT COUNT(*) FROM free")
	int boardindex();
	

	//admin

	@Select("SELECT * FROM free LIMIT 20")
	List<Board> boardList();
	
	@Select("SELECT COUNT(*) FROM free LIMIT 20")
	int boardListIndex();
	
	@Select("SELECT * FROM free LIMIT ${index}")
    List<Board> boardListNum(int index) throws ClassNotFoundException, SQLException;
	   
	
	@Select("SELECT COUNT(*) FROM free Where writer LIKE '%${query}%' || title LIKE '%${query}%' || content LIKE '%${query}%'  || hit LIKE '%${query}%' LIMIT 20")
	int boardSearch(String query);

}
