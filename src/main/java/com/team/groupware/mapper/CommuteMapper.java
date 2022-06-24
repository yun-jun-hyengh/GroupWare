package com.team.groupware.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.team.groupware.domain.CommuteVO;

@Mapper
public interface CommuteMapper {
	
	// 출근
	public void startinsert(CommuteVO vo) throws Exception;
	
	// 출퇴근 조회 
	public CommuteVO read(int workId) throws Exception;
	
	// 퇴근
	public void endtime(CommuteVO vo) throws Exception;
}
