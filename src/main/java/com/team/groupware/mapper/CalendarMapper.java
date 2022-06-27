package com.team.groupware.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.team.groupware.domain.CalendarVO;

@Mapper
public interface CalendarMapper {
	// 일정등록
	public void calinsert(CalendarVO vo) throws Exception;
}
