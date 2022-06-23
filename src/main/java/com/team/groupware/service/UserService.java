package com.team.groupware.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team.groupware.domain.MemberVO;

public interface UserService {
	
	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 아이디 찾기 
	public String find_id(HttpServletResponse response, String email) throws Exception;
	
	// 회원정보수정
	public void memberUpdate(MemberVO vo, HttpServletRequest request) throws Exception;
	
	// 정보조회
	public MemberVO selectMember(String email) throws Exception;
	
	// 비밀번호 변경
	public void pwUpdate_M(MemberVO vo) throws Exception;

}
