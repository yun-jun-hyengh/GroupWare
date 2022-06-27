package com.team.groupware.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.groupware.domain.CalendarVO;
import com.team.groupware.mapper.CalendarMapper;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarMapper mapper;

	@Override
	public void calinsert(CalendarVO vo) throws Exception {
		mapper.calinsert(vo);
	}

}
