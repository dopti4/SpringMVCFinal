package com.ja.freeboard.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.freeboard.mapper.HobbySQLMapper;
import com.ja.freeboard.mapper.MemberSQLMapper;
import com.ja.freeboard.vo.MemberVo;

@Service
public class MemberServiceImpl {
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private HobbySQLMapper hobbySQLMapper; 
	
	public void joinMember(MemberVo memberVo, int [] member_hobby) {
		
		//가장 큰 값 구해서 넣어주기.
		int member_key = memberSQLMapper.createKey();
		
		memberVo.setMember_no(member_key);
		
		//매퍼 sql문 호출
		memberSQLMapper.insert(memberVo);
		
		//hobbySQLMapper.insert(member_key, member_hobby[0]);
		//배열이니까 반복문으로 넣어준다.
		try {
			for(int hobby : member_hobby) {
				
				hobbySQLMapper.insert(member_key, hobby);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
