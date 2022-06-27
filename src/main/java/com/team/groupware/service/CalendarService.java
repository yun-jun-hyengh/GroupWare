package com.team.groupware.service;

import com.team.groupware.domain.CalendarVO;

public interface CalendarService {
	// 일정등록
	public void calinsert(CalendarVO vo) throws Exception;
}
