package com.team.groupware.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.groupware.domain.CalendarVO;

@Mapper
public interface CalendarMapper {
	// 일정등록
	public void calinsert(CalendarVO vo) throws Exception;
	
	// 일정 리스트 
	public List<CalendarVO> calendarList() throws Exception;
}
