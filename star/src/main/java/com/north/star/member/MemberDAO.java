package com.north.star.member;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int loginCk(HashMap<String, String> memberCk) {
		
		
		return sqlSession.selectOne("member.loginCk",memberCk);
	}

	public String memberNickCk(String memberNickCk) {
		String returnvalue = null;
		int result = sqlSession.selectOne("member.memberNickCk",memberNickCk);
		if (result == 1) {
			returnvalue ="1";
		}else {
			returnvalue = "0";
		}
		return returnvalue;
	}
	
}
