package com.team.groupware.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.groupware.domain.GojiReplyVO;
import com.team.groupware.mapper.GojiReplyMapper;

@Service
public class GojiReServiceImpl implements GojiReService {
	
	@Autowired
	private GojiReplyMapper dao;
	
	@Override
	public void writeReply(GojiReplyVO vo) throws Exception {
		dao.writeReply(vo);
	}

	@Override
	public List<GojiReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	@Override
	public int deleteReply(int bno) throws Exception {
		return dao.deleteReply(bno);
	}
	
}
