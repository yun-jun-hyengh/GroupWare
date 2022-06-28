package com.team.groupware.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.team.groupware.domain.CommuteVO;
import com.team.groupware.domain.MemberVO;

public interface CommuteService {
	// 출근
	public void startinsert(CommuteVO vo) throws Exception;
	
	// 관리자 직원 출퇴근 관리
	public List<CommuteVO> staffcommute() throws Exception;
	
	// 엑셀 다운로드 
	public void excelDown(CommuteVO vo, HttpServletResponse response) throws Exception;
	
	// 개인 근태내역 조회 
	public List<CommuteVO> mycommute(String memberId) throws Exception;
}
