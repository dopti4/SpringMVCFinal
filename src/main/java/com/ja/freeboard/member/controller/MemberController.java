package com.ja.freeboard.member.controller;


import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ja.freeboard.member.service.MemberServiceImpl;
import com.ja.freeboard.vo.AuthVo;
import com.ja.freeboard.vo.MemberVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private JavaMailSenderImpl javaMailSenderImpl;	//메일 발송용 인터페이스
	
	@RequestMapping("/login_page.do")
	public String loginPage() {
		
		System.out.println("로그인페이지 컨트롤러 호출됨");
		
		return "member/login_page";
	}
	
	@RequestMapping("/join_member_page.do")
	public String joinMemberPage() {
		
		return "member/join_member_page";
	}
	
	@RequestMapping("/join_member_process.do")
	public String joinMemberProcess(MemberVo memberVo, int [] member_hobby) {	//hobby 따로 배열로 받기(VO값 없으니까).
		
		//인증키 생성
		AuthVo authVo = new AuthVo();
		String authKey = UUID.randomUUID().toString();	//랜덤 키 생성
		authVo.setAuth_key(authKey);					//vo에 담아준다.
		
		
		//서비스 -> 매퍼
		memberService.joinMember(memberVo, member_hobby, authVo);
		
		
		//메일 발송
		FBMailSenderThread thread = new FBMailSenderThread(javaMailSenderImpl, memberVo.getMember_id(), authVo.getAuth_key());
		thread.start();		//스타트가 스레드 핵심
		
		
		
		return "redirect:./login_page.do";
	}
	
	@RequestMapping("/login_process.do")
	public String loginProcess(MemberVo memberVo, HttpSession session) {	//세션 객체 쓰기 위해 받아준다.
		
		MemberVo userData = memberService.login(memberVo);
		
		if(userData == null) {
			//로그인 실패
			return "/member/login_fail";
			
		}else {
			//로그인 성공
			session.setAttribute("sessionUser", userData);
			return "redirect:/board/main_page.do";
		}
	}
	
	@RequestMapping("/logout_process.do")
	public String logoutProcess(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/board/main_page.do";
	}
	
	@RequestMapping("/certification_process.do")
	public String certificationProcess(String key) {
		
		memberService.certification(key);
		
		return "/member/certification_complete";
	}
	
	@RequestMapping("/testAjax.do")
	public String testAjax() {
		
		System.out.println("testAjax 호출");
		
		return "member/testAjax";
	}
	
	@RequestMapping("/confirmId.do")
	@ResponseBody	//리턴되는 값으로 포워딩하지 않고 값 자체(문자열)를 넘겨줌. -> 리로드하지 않기 위해 사용
	public String confirmId(String id) {
		
		System.out.println("넘어온 값 : " + id);
		if(memberService.confirmId(id)) {
			return "true";
		}else {
			return "false";
		}
	}
}

//메일 발송을 위한 스레드
class FBMailSenderThread extends Thread {
	
	private String to;
	private String authKey;
	private JavaMailSenderImpl javaMailSenderImpl;
	
	public FBMailSenderThread(JavaMailSenderImpl javaMailSenderImpl, String to, String authKey) {
		this.javaMailSenderImpl = javaMailSenderImpl;
		this.to = to;
		this.authKey = authKey;
	}
	
	public void run() {
		
		try {
			
			MimeMessage message = null;
		    MimeMessageHelper messageHelper = null;
	        message = javaMailSenderImpl.createMimeMessage();
	        messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	        messageHelper.setSubject("이메일 인증을 해주세요!");			//제목
	        
	        String text = "";
	        String link = "http://localhost:8181/freeboard/member/certification_process.do?key=" + authKey;
	        text += "FB 회원가입을 축하드립니다.<br>";
	        text += "회원가입 완료를 위해 아래 링크를 클릭해주세요.";
	        text += "<a href='" +link+ "'>";
	        text += "링크 클릭";
	        text += "</a>";
	        		
	        messageHelper.setText(text, true);								//내용
	        messageHelper.setFrom("111", "FB관리자");						//보내는 사람
	        messageHelper.setTo("christ444@naver.com");						//받는 사람
	        //messageHelper.addInline(contentId, dataSource);
	        javaMailSenderImpl.send(message);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}