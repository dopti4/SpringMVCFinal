package com.ja.freeboard.board.controller;


import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.freeboard.board.service.BoardServiceImpl;
import com.ja.freeboard.vo.BoardVo;
import com.ja.freeboard.vo.MemberVo;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardServiceImpl boardServiceImpl;
	
	@RequestMapping("/main_page.do")
	public String mainPage(Model model) {
		
		List<Map<String, Object>> list = boardServiceImpl.getBoardList();
		
		model.addAttribute("dataList", list);	//리퀘스트.셋어트리뷰트랑 같다.
		
		return "board/main_page";
	}
	
	@RequestMapping("/write_content_page.do")
	public String writeContentPage() {
		
		return "board/write_content_page";
	}
	
	@RequestMapping("/write_content_process.do")
	public String writeContentProcess(BoardVo boardVo, HttpSession session) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");	//MemberVo로 넣었으니 타입캐스팅 필요
		
		//boardvo에 member_no 값이 없으니 담아주자.
		boardVo.setMember_no(memberVo.getMember_no());
		
		boardServiceImpl.writeContent(boardVo);
		
		return "redirect:./main_page.do";
	}
}
