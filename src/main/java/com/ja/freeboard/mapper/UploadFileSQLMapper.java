package com.ja.freeboard.mapper;

import java.util.List;

import com.ja.freeboard.vo.UploadFileVo;

public interface UploadFileSQLMapper {
	
	public void insert(UploadFileVo uploadFileVo);
	
	public List<UploadFileVo> selectByBoardNo(int board_no);
}
