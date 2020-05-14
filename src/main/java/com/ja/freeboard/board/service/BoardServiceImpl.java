package com.ja.freeboard.board.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.freeboard.mapper.BoardSQLMapper;
import com.ja.freeboard.mapper.MemberSQLMapper;
import com.ja.freeboard.mapper.UploadFileSQLMapper;
import com.ja.freeboard.vo.BoardVo;
import com.ja.freeboard.vo.MemberVo;
import com.ja.freeboard.vo.UploadFileVo;

@Service
public class BoardServiceImpl {
	
	@Autowired
	private BoardSQLMapper boardSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private UploadFileSQLMapper uploadFileSQLMapper;
	
	public void writeContent(BoardVo boardVo, List<UploadFileVo> uploadFileVoList) {
		
		int boardKey = boardSQLMapper.createKey();
		boardVo.setBoard_no(boardKey);
		
		boardSQLMapper.insert(boardVo);
		
		for(UploadFileVo uploadFileVo : uploadFileVoList) {
			
			uploadFileVo.setBoard_no(boardKey);
			
			uploadFileSQLMapper.insert(uploadFileVo);
			
		}
		
	}
	
	public int getBoardDataCount(String searchWord) {
		
		if(searchWord == null) {
			return boardSQLMapper.selectAllCount();
		}else {
			return boardSQLMapper.selectByTitleCount(searchWord);
		}
		
	}
	
	//게시글 출력
	//리스트 안에 맵
	public List<Map<String, Object>> getBoardList(String searchWord, int currentPage){
		//다형성 이용 어레이리스트로 생성
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<BoardVo> boardList = null;
		
		if(searchWord == null) {
			boardList = boardSQLMapper.selectAll(currentPage);
		}else {
			boardList = boardSQLMapper.selectByTitle(searchWord, currentPage);
		}
		
		
		for(BoardVo boardVo : boardList) {
			
			MemberVo memberVo = memberSQLMapper.selectByNo(boardVo.getMember_no());
			
			//1.8버전부터 뒤에 <> 빼도 되긴함.
			Map<String, Object> map = new HashMap<>();
			
			map.put("memberVo", memberVo);	//${memberVo}로 가져올 수 있다.
			map.put("boardVo", boardVo);
			
			list.add(map);
			
		}
		
		return list;
		
	}
	
	public Map<String, Object> getBoard(int board_no){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boardSQLMapper.updateReadCount(board_no);
		
		//담기
		BoardVo boardVo = boardSQLMapper.selectByNo(board_no);
		
		MemberVo memberVo = memberSQLMapper.selectByNo(boardVo.getMember_no());
		
		List<UploadFileVo> uploadFileVoList = uploadFileSQLMapper.selectByBoardNo(board_no);
		
		
		map.put("memberVo", memberVo);
		map.put("boardVo", boardVo);
		map.put("uploadFileVoList", uploadFileVoList);
		
		
		return map;
		
	}
	
	public void deleteContent(int board_no) {
		
		boardSQLMapper.deleteByNo(board_no);
		
	}
	
	public void updateContent(BoardVo boardVo) {
		
		boardSQLMapper.update(boardVo);
		
	}
	
}
