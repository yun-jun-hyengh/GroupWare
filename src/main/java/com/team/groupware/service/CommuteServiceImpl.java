package com.team.groupware.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.groupware.domain.CommuteVO;
import com.team.groupware.mapper.CommuteMapper;

@Service
public class CommuteServiceImpl implements CommuteService {
	
	@Autowired
	private CommuteMapper mapper;
	
	@Override
	public void startinsert(CommuteVO vo) throws Exception {
		mapper.startinsert(vo);
	}
	

}
