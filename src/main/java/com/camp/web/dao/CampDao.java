package com.camp.web.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.web.entity.Camp;


@Mapper
public interface CampDao {
	
  @Select("SELECT * FROM camping2 Where address LIKE '%${reg}%' LIMIT 10")
  List<Camp> getList(String reg) throws ClassNotFoundException, SQLException;
  
  @Select("SELECT * FROM camping2 LIMIT 100")
  List<Camp> recommend() throws ClassNotFoundException, SQLException;
  
  @Select("SELECT * FROM camping2 Where id=#{id}")
  List<Camp> getDetail(int id) throws ClassNotFoundException, SQLException;
  
  @Select("SELECT * FROM camping2 Where address LIKE '%${reg}%' limit 10 offset ${index}")
  List<Camp> getScroll(String reg,int index) throws ClassNotFoundException, SQLException;	
}
