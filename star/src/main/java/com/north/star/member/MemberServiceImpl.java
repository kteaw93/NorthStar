package com.north.star.member;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Autowired
	private JavaMailSenderImpl mailSender;

	private int size;
	
	
    //인증키 생성
    private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String email) {
        //6자리 난수 인증번호 생성
        String authKey = getKey(6);

        //인증메일 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
            .append("<p>인증번호는")
            .append(authKey)
            .append("</p>")
            .toString());
            sendMail.setFrom(email, "관리자");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        
          return authKey;
    }
  

	
	
	
	
	@Override
	public int loginCk(HashMap<String, String> memberCk) {

		return dao.loginCk(memberCk);
	}

	@Override
	public String memberNickCk(String memberNickCk) {
		return dao.memberNickCk(memberNickCk);
	}

}
