package com.team.groupware.service;

import java.util.List;

import com.team.groupware.domain.MemberVO;

public interface AdminService {
	// 사원등록
	public void register(MemberVO vo) throws Exception;
	
	// 사원리스트
	public List<MemberVO> list() throws Exception;
	
	// 사원삭제 
	public void delete(String memberId);
	
	// 아이디 중복 체크
	public int idChk(String memberId) throws Exception;
	
	// 회원조회 
	public MemberVO read(String memberId) throws Exception;
	
	// 회원권한관리
	public void update(MemberVO vo) throws Exception;
	
}
