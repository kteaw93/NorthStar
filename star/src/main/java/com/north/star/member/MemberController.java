package com.north.star.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("loginView")
	public String loginView() {
		return "member/loginView";
	}
	
	@RequestMapping("loginCk")
	@ResponseBody
	public int loginCk(@RequestParam Map<String, Object> map) {
		
		System.out.println( (String)map.get("memberId") ) ;
		System.out.println( (String)map.get("memberPw") ) ;
		
		HashMap<String,String> memberCk = new HashMap<String, String>();
		memberCk.put("memberId", (String)map.get("memberId") );
		memberCk.put("memberPw", (String)map.get("memberPw") );
		
		int result = service.loginCk(memberCk);
		System.out.println(result);
		return result;
	}
	
	
	@RequestMapping("tosView")
	public String tosView() {
		return "member/tosView";
	}
	
	@RequestMapping("signUpView")
	public String signUpView() {
		
		return "member/signUpView";
	}
	//email 인증 구현
	@RequestMapping("memberEmailCk")
	@ResponseBody
	public String memberEmailCk( @RequestParam Map<String, Object> map) {
		String email = (String)map.get("memberId");
		
        //임의의 authKey 생성 & 이메일 발송
        String authKey = service.sendAuthMail(email);
        System.out.println("authKey" + authKey);
        
        
		return authKey;
	}
	 
	@RequestMapping("memberNickCk")
	@ResponseBody
	public String memberNickCk( @RequestParam Map<String, Object> map) {
		String memberNickCk = (String)map.get("memberNick");
		return service.memberNickCk(memberNickCk);
	}
}
