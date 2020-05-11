package com.ja.freeboard.mapper;

import java.util.List;

import com.ja.freeboard.vo.BoardVo;

public interface BoardSQLMapper {
	
	//글쓰기
	public void insert(BoardVo boardVo);
	
	//글 하나 보기
	public BoardVo selectByNo(int no);
	
	//전체 글 리스트
	public List<BoardVo> selectAll();
	
	//글삭제
	public void deleteByNo(int no);
	
	//글수정
	public void update(BoardVo boardVo);
	
	//조회수
	public void updateReadCount(int no);
}
