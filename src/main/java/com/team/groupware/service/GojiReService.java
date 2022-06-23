package com.team.groupware.service;

import java.util.List;

import com.team.groupware.domain.GojiReplyVO;

public interface GojiReService {
	public void writeReply(GojiReplyVO vo) throws Exception;
	public List<GojiReplyVO> readReply(int bno) throws Exception;
	public int deleteReply(int bno) throws Exception;
	
}
