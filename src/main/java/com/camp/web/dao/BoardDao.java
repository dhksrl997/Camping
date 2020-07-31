package com.camp.web.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camp.web.entity.Board;
import com.camp.web.entity.Camp;

@Mapper
public interface BoardDao {
	@Insert("INSERT INTO free (title,content,writer) VALUES('${title}','${content}','${writer}')")
	   int insertBoard(String writer, String title, String content);

	   @Select("SELECT * FROM ${cate} order by regDate desc limit 100 offset ${index}")
	   List<Board> getBoard(String cate,int index);
	   
	   @Select("UPDATE ${cate} SET hit=hit +1 WHERE id=${id}")
	   List<Board> hit(String cate,int id);

	   @Select("SELECT * FROM ${cate} where id=${id}")
	   List<Board> getDetail(String cate, int id);

	   @Select("SELECT img1, name, address from camper WHERE name LIKE '%${content}%'") 
	   List<Camp> getSearchResult(String content);

	   @Select("SELECT MAX(id) from ${category}")
	   int getMaxId(String category);

	
	//admin
	@Select("SELECT * FROM free LIMIT 20")
	List<Board> boardList();
	
	@Select("SELECT COUNT(*) FROM free")
	int boardIndex();
	
	@Select("SELECT * FROM free LIMIT ${index}")
    List<Board> boardListNum(int index) throws ClassNotFoundException, SQLException;
	   
	@Select("SELECT * FROM free Where writer LIKE '%${query}%' || title LIKE '%${query}%' || content LIKE '%${query}%'  || hit LIKE '%${query}%' LIMIT 20")
	List<Board> boardSearch(String query);
	
	@Select("SELECT COUNT(*) FROM free Where writer LIKE '%${query}%' || title LIKE '%${query}%' || content LIKE '%${query}%'  || hit LIKE '%${query}%' LIMIT 20")
	int boardSearchIndex(String query);

	
	@Select("SELECT *FROM free where id= '${id}'")
	List<Board> selectDetail(String id);

	@Update("UPDATE free SET title='${title}', content='${content}' where id= '${id}';")
	int updateBoard(Board board);

}



