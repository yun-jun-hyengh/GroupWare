package com.team.groupware.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.team.groupware.domain.MemberVO;

@Mapper
public interface UserMapper {
	
	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 아이디 찾기 
	public String find_id(String email) throws Exception;
	
	// 회원정보수정
	public void memberUpdate(MemberVO vo) throws Exception;
	
	// 회원정보 조회
	public MemberVO selectMember(String email) throws Exception;
	
	// 비밀번호 변경
	public void pwUpdate_M(MemberVO vo) throws Exception;

}
