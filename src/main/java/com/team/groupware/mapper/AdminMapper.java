package com.team.groupware.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.groupware.domain.MemberVO;

@Mapper
public interface AdminMapper {
	
	// 사원등록 
	public void register(MemberVO vo) throws Exception;
	
	// 사원리스트
	public List<MemberVO> list() throws Exception;
	
	// 사원삭제
	public void delete(String memberId);
	
	// 아이디 중복체크
	public int idChk(String memberId) throws Exception;
	
	// 회원조회
	public MemberVO read(String memberId) throws Exception;
	
	// 권한관리
	public void update(MemberVO vo) throws Exception;
}
