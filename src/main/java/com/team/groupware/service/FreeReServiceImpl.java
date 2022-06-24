package com.team.groupware.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.groupware.domain.FreeReplyVO;
import com.team.groupware.mapper.FreeReplyMapper;


@Service
public class FreeReServiceImpl implements FreeReService{
	@Autowired
	private FreeReplyMapper dao;
	
	@Override
	public void writeReply(FreeReplyVO vo) throws Exception {
		dao.writeReply(vo);
	}

	@Override
	public List<FreeReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	@Override
	public int deleteReply(int bno) throws Exception {
		return dao.deleteReply(bno);
	}
}
