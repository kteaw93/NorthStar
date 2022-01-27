package com.north.star.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List boardArea() {
		
		return sqlSession.selectList("board.boardArea");
	}
	
	
}
