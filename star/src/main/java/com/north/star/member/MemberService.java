package com.north.star.member;

import java.util.HashMap;

public interface MemberService {

	int loginCk(HashMap<String, String> memberCk);

	int memberNickCk(String memberNickCk);

	String sendAuthMail(String email);

	int emailCk(String email);

	int memberSubmit(HashMap<String, String> member);

}
