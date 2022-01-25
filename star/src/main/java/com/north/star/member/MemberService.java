package com.north.star.member;

import java.util.HashMap;

public interface MemberService {

	int loginCk(HashMap<String, String> memberCk);

	String memberNickCk(String memberNickCk);

	String sendAuthMail(String email);

}
