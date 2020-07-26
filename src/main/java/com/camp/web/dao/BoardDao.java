package com.camp.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.web.entity.Board;

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
	

}
