package com.camp.web.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camp.web.entity.Board;
import com.camp.web.entity.BoardComment;
import com.camp.web.entity.Camp;

@Mapper
public interface BoardDao {
   @Insert("INSERT INTO ${category} (title,content,writer) VALUES('${title}','${content}','${writer}')")
      int insertBoard(String category,String writer, String title, String content);

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

   @Select("SELECT COUNT(*) from free;")
   int selectCount(int index);
   
   @Select("SELECT *FROM ${category} ORDER BY id DESC LIMIT #{offset},#{size};")
   List<Board> select(String category, int index, int offset, int size);

   
   //리뷰게시판
   @Select("SELECT COUNT(*) from review;")
   int selectReviewCount(int index);

   @Select("SELECT *FROM ${category} ORDER BY id DESC LIMIT #{offset},#{size};")
   List<Board> selectReview(String category, int index, int offset, int size);

   @Insert("INSERT INTO boardcomment (writer,content,boardId) VALUES('${writer}','${content}','${boardId}')")
   int insertCmt(String writer,String content, int boardId);

   @Select("SELECT * FROM boardcomment where boardId = ${id} order by regDate desc")
   List<BoardComment> getLists(int id);

   
   @Delete("DELETE FROM boardcomment where id = ${id}")
   int deleteComment(int id);


   
}


