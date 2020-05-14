package com.ja.freeboard.board.controller;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ja.freeboard.board.service.BoardServiceImpl;
import com.ja.freeboard.vo.BoardVo;
import com.ja.freeboard.vo.MemberVo;
import com.ja.freeboard.vo.UploadFileVo;

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
	
	@RequestMapping("/write_content_process.do")	//파일업로드용 변수 추가
	public String writeContentProcess(MultipartFile [] upload_files, BoardVo boardVo, HttpSession session) {
		
		//루트 폴더 설정
		String uploadRootFolderName = "C:/upload/";
		
		//날짜별로 폴더 생성하기 위해
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		String todayFolder = df.format(today);	//데이트 -> 스트링
		
		//경로 + 폴더명
		String saveFolderName = uploadRootFolderName + todayFolder;
		
		File saveFolder = new File(saveFolderName);
		
		//폴더 존재하지 않으면 생성
		if(!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
		
		//Vo에 담은 값 넘겨주기 위해 list에 넣어준다.
		List<UploadFileVo> uploadFileVoList = new ArrayList<UploadFileVo>();
		
		
		//파일 업로드 - 배열이니까 for
		for(MultipartFile file : upload_files) {
			
//			System.out.println("file_name : " + file.getOriginalFilename());
//			System.out.println("file_size : " + file.getSize());
			
			//예외 처리
			if(file.getSize() <= 0) {
				continue;
			}
			
			//파일명 중복 방지(랜덤 이름, 시간)
			String originalFileName = file.getOriginalFilename();
			
			String saveFileName = UUID.randomUUID().toString();
			saveFileName += "_" + System.currentTimeMillis();
			//확장자명 붙여주기 위해서 서브스트링으로 . 찾아서 짜른다
			saveFileName += originalFileName.substring(originalFileName.lastIndexOf("."));
			
			//폴더명 + 파일명 합치자
			String saveRealPath = saveFolderName + "/" + saveFileName;
			
			//트라이캐치 써줘야함
			try {
				file.transferTo(new File(saveRealPath));				
			}catch(Exception e) {
				e.printStackTrace();
			}

			//DB를 위한 fileVo객체 생성
			UploadFileVo uploadFileVo = new UploadFileVo();
			
			uploadFileVo.setFile_link_path(todayFolder + "/" + saveFileName);
			uploadFileVo.setFile_real_path(saveRealPath);
			
			uploadFileVoList.add(uploadFileVo);
			
		}
		
		
		
		//데이터 처리
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");	//MemberVo로 넣었으니 타입캐스팅 필요
		
		//boardvo에 member_no 값이 없으니 담아주자.
		boardVo.setMember_no(memberVo.getMember_no());
		
		boardServiceImpl.writeContent(boardVo, uploadFileVoList);
		
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
