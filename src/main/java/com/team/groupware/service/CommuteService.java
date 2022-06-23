package com.team.groupware.service;

import com.team.groupware.domain.CommuteVO;

public interface CommuteService {
	// 출근
	public void startinsert(CommuteVO vo) throws Exception;
}
