package com.camp.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.web.entity.Board;

@Mapper
public interface BoardDao {
	@Insert("INSERT INTO freeBoard (title,content,writer) VALUES('${title}','${content}','${writer}')")
	int insertBoard(String writer, String title, String content);

	@Select("SELECT * FROM ${cate} limit 100 offset ${index}")
	List<Board> getBoard(String cate,int index);
	
	@Select("UPDATE ${cate} SET hit=hit+1 WHERE id=${id}")
	List<Board> hit(String cate,int id);

	@Select("SELECT * FROM ${cate} where id=${id}")
	List<Board> getDetail(String cate, int id);

	
}
