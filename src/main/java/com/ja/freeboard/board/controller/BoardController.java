package com.ja.freeboard.board.controller;


import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.freeboard.board.service.BoardServiceImpl;
import com.ja.freeboard.vo.BoardVo;
import com.ja.freeboard.vo.MemberVo;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardServiceImpl boardServiceImpl;
	
	@RequestMapping("/main_page.do")
	public String mainPage(Model model, String search_word, 
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {	//검색 폼 받아주기 위해 매개변수 추가
												//값이 무조건 필요한 경우는 true
		if(currentPage <= 0) {
			currentPage = 1;
		}
		
		List<Map<String, Object>> list = boardServiceImpl.getBoardList(search_word, currentPage);
		
		//총 게시글 수
		int totalCount = boardServiceImpl.getBoardDataCount(search_word);
		
		//페이지 짜르는 거 할 거야
		int beginPage = ((currentPage-1) / 5) * 5 + 1;
		int endPage = ((currentPage-1)/5+1)*5;
		
		if(endPage > (totalCount-1)/10 + 1) {
			endPage = (totalCount-1)/10 + 1;
		}
		
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalCount", totalCount);
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
	
	@RequestMapping("/read_content_page.do")
	public String readContentPage(int board_no, Model model) {
		
		Map<String, Object> map = boardServiceImpl.getBoard(board_no);
		
		model.addAttribute("readContent", map);
		
		return "board/read_content_page";
	}
	
	@RequestMapping("/delete_content_process.do")
	public String deleteContent(int board_no) {
		
		boardServiceImpl.deleteContent(board_no);
		
		return "redirect:/board/main_page.do";
	}
	
	@RequestMapping("/update_content_page.do")
	public String updateCotentPage(int board_no, Model model) {
		
		model.addAttribute("readContent", boardServiceImpl.getBoard(board_no));
		
		return "board/update_content_page";
	}
	
	@RequestMapping("/update_content_process.do")
	public String updateContentProcess(BoardVo boardVo) {
		
		boardServiceImpl.updateContent(boardVo);
		
		return "redirect:/board/main_page.do";
	}
	
	
	
}
