package com.team.groupware.service;

import com.team.groupware.domain.CommuteVO;

public interface CommuteService {
	// 출근
	public void startinsert(CommuteVO vo) throws Exception;
	
	// 출퇴근여부
	public CommuteVO read(int workId) throws Exception;
	
	// 퇴근
	public void endtime(CommuteVO vo) throws Exception;
}
