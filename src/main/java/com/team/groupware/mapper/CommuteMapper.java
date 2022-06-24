package com.team.groupware.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.team.groupware.domain.CommuteVO;

@Mapper
public interface CommuteMapper {
	
	// 출근
	public void startinsert(CommuteVO vo) throws Exception;
	
}
