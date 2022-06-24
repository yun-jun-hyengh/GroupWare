package com.team.groupware.service;

import java.util.List;

import com.team.groupware.domain.FreeReplyVO;


public interface FreeReService {
	public void writeReply(FreeReplyVO vo) throws Exception;
	public List<FreeReplyVO> readReply(int bno) throws Exception;
	public int deleteReply(int bno) throws Exception;
}
