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
 
	public int memberNickCk(String memberNickCk) {
		String returnvalue = null;
		int result = sqlSession.selectOne("member.memberNickCk",memberNickCk);

		return result;
	}

	public int emailCk(String email) {
		return sqlSession.selectOne("member.emailCk",email);
	}

	public int memberSubmit(HashMap<String, String> member) {
		System.out.println(sqlSession.insert("member.memberSubmit",member));
		return sqlSession.insert("member.memberSubmit",member);
	}
	
}
