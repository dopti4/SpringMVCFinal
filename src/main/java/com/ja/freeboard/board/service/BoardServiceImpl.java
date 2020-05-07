package com.ja.freeboard.board.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.freeboard.mapper.BoardSQLMapper;
import com.ja.freeboard.mapper.MemberSQLMapper;
import com.ja.freeboard.vo.BoardVo;
import com.ja.freeboard.vo.MemberVo;

@Service
public class BoardServiceImpl {
	
	@Autowired
	private BoardSQLMapper boardSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public void writeContent(BoardVo boardVo) {
		
		boardSQLMapper.insert(boardVo);
		
	}
	
	//리스트 안에 맵
	public List<Map<String, Object>> getBoardList(){
		//다형성 이용 어레이리스트로 생성
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<BoardVo> boardList = boardSQLMapper.selectAll();
		
		for(BoardVo boardVo : boardList) {
			
			MemberVo memberVo = memberSQLMapper.selectByNo(boardVo.getMember_no());
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("memberVo", memberVo);	//${memberVo}로 가져올 수 있다.
			map.put("boardVo", boardVo);
			
			list.add(map);
			
		}
		
		return list;
		
	}
	
}
