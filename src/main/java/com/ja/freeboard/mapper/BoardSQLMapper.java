package com.ja.freeboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ja.freeboard.vo.BoardVo;

public interface BoardSQLMapper {
	
	//글쓰기
	public void insert(BoardVo boardVo);
	
	//글 하나 보기
	public BoardVo selectByNo(int no);
	
	//게시글 개수
	public int selectAllCount();
	
	//검색시 게시글 개수
	public int selectByTitleCount(String title);
	
	//전체 글 리스트
	public List<BoardVo> selectAll(int currentPage);
	
	//제목 검색(매개변수는 무조건 하나 밖에 못 받는다. 따라서 @param 써줘야함!)
	public List<BoardVo> selectByTitle(@Param("title") String title, @Param("currentPage") int currentPage);
	
	//글삭제
	public void deleteByNo(int no);
	
	//글수정
	public void update(BoardVo boardVo);
	
	//조회수
	public void updateReadCount(int no);
}
