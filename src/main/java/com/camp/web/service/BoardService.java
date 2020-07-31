package com.camp.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.web.dao.BoardDao;
import com.camp.web.entity.Board;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao boardDao;

	public int selectBoardCount(int index) {
		
		return boardDao.selectCount(index);
	}

	public List<Board> selectBoardList(int index, String category) {

		int size = 10;
		int offset = (index-1) *size;
		
		return boardDao.select(category,index,offset,size);
	}



}
