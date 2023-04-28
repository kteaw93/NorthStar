package com.north.star.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO Dao;

	@Override
	public List boardArea() {
		return Dao.boardArea();
	}

	@Override
	public List boardDetail(int writeNum) {
		return Dao.boardDetail(writeNum);
	}
}
 