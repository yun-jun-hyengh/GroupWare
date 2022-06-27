package com.team.groupware.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.groupware.domain.CommuteVO;

@Mapper
public interface CommuteMapper {
	
	// 출근
	public void startinsert(CommuteVO vo) throws Exception;
	
	// 관리자 직원 출퇴근 관리 
	public List<CommuteVO> staffcommute() throws Exception;
	
	// 개인 근태내역 조회 
	public List<CommuteVO> mycommute() throws Exception;
}
