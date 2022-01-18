package com.north.star.common;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int testNum() {
		return sqlSession.selectOne("Common.testNum");
	}
	
	
	
}
