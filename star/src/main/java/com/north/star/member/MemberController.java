package com.north.star.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes("memberSessionId")
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
	public int loginCk(@RequestParam Map<String, Object> map,Model model) {

		HashMap<String, String> memberCk = new HashMap<String, String>();
		memberCk.put("memberId", (String) map.get("memberId"));
		memberCk.put("memberPw", (String) map.get("memberPw"));
		int result = service.loginCk(memberCk);
		if(result == 1) {
			
			model.addAttribute("memberSessionId",(String) map.get("memberId") );			
		}
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

	// email 인증 구현
	@RequestMapping("memberEmailCk")
	@ResponseBody
	public String memberEmailCk(@RequestParam Map<String, Object> map) {
		String email = (String) map.get("memberId");
		String authKey = null;
		int emailCk = service.emailCk(email);
		System.out.println("아아아아아악" + emailCk);
		if(emailCk != 1) {
			
			// 임의의 authKey 생성 & 이메일 발송
			authKey = service.sendAuthMail(email);
		}else {
			authKey = "0";
		}

		return authKey;
	}

	@RequestMapping("memberNickCk")
	@ResponseBody
	public int memberNickCk(@RequestParam Map<String, Object> map) {
		String memberNickCk = (String) map.get("memberNick");
		
		return service.memberNickCk(memberNickCk);
	}
	
	@RequestMapping("memberSubmit")
	@ResponseBody
	public int memberSubmit(@RequestParam Map<String, Object> map) {


		
		HashMap<String, String> member = new HashMap<String, String>();
		member.put("memberEmail", (String) map.get("memberEmail"));
		member.put("memberPw1", (String) map.get("memberPw1"));
		member.put("memberNick", (String) map.get("memberNick"));
		member.put("memberNm", (String) map.get("memberNm"));
		member.put("memberPhone", (String) map.get("memberPhone"));
		member.put("memberGrade", (String) map.get("memberGrade"));
		
		int result = service.memberSubmit(member);
		
		return result;
	}
	
	//로그아웃 처리
	@RequestMapping("logout")
	@ResponseBody
	public int logout(HttpSession session,SessionStatus status) {
		System.out.println("session은" + session);
		status.setComplete();
		return 1;
	}
	
}
