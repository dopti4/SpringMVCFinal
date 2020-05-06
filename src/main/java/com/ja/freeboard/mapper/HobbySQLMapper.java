package com.ja.freeboard.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.ja.freeboard.vo.HobbyVo;

public interface HobbySQLMapper {
	
	@Insert("INSERT INTO FB_Hobby VALUES(FB_Hobby_seq.NEXTVAL, #{member_no}, #{hobby_category_no})")
	public void insert(
					@Param("member_no") int member_no,						//원래는 매개변수 하나밖에 못 받는다. 
					@Param("hobby_category_no") int hobby_category_no);		//2개 이상 받을 때는 @param 어노테이션 붙여주자!
	
}
