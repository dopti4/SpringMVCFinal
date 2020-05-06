package com.ja.freeboard.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.ja.freeboard.vo.MemberVo;

public interface MemberSQLMapper {
	
	@Select("SELECT FB_Member_seq.NEXTVAL FROM DUAL")
	public int createKey();
	
	@Insert("INSERT INTO FB_Member VALUES(#{member_no}, #{member_id}, #{member_pw}, #{member_nick}, #{member_sex}, SYSDATE)")
	public void insert(MemberVo memberVo);
	
	
}
