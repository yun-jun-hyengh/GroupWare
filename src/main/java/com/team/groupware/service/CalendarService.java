package com.team.groupware.service;

import java.util.List;

import com.team.groupware.domain.CalendarVO;

public interface CalendarService {
	// 일정등록
	public void calinsert(CalendarVO vo) throws Exception;
	
	// 일정리스트
	public List<CalendarVO> calendarList() throws Exception;
}
