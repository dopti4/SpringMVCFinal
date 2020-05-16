package com.ja.freeboard.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.freeboard.mapper.AuthSQLMapper;
import com.ja.freeboard.mapper.HobbySQLMapper;
import com.ja.freeboard.mapper.MemberSQLMapper;
import com.ja.freeboard.util.FBMessageDigest;
import com.ja.freeboard.vo.AuthVo;
import com.ja.freeboard.vo.MemberVo;

import java.security.*;

@Service
public class MemberServiceImpl {
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private HobbySQLMapper hobbySQLMapper;
	@Autowired
	private AuthSQLMapper authSQLMapper;
	
	public void joinMember(MemberVo memberVo, int [] member_hobby, AuthVo authVo) {
		
		//비밀번호 해싱
		String hashCode = FBMessageDigest.digest(memberVo.getMember_pw());
		memberVo.setMember_pw(hashCode);
		
		
		
		//DB 연동
		//가장 큰 값 구해서 넣어주기.
		int member_key = memberSQLMapper.createKey();
		memberVo.setMember_no(member_key);
		
		//매퍼 sql문 호출
		memberSQLMapper.insert(memberVo);
		
		//인증
		authVo.setMember_no(member_key);
		authSQLMapper.insert(authVo);
		
		//hobbySQLMapper.insert(member_key, member_hobby[0]);
		//배열이니까 반복문으로 넣어준다.
		if(member_hobby == null) {	//널포인터익셉션 예외처리
			return;
		}
		
		for(int hobby : member_hobby) {
				
			hobbySQLMapper.insert(member_key, hobby);

		}
			
	}
	
	public MemberVo login(MemberVo memberVo) {
		
		//비밀번호 해싱
		String hashCode = FBMessageDigest.digest(memberVo.getMember_pw());
		memberVo.setMember_pw(hashCode);
		
		return memberSQLMapper.selectByIdAndPw(memberVo);
		
	}
	
	public void certification(String key) {
		
		authSQLMapper.update(key);
		
	}
	
}
