package com.team.groupware.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.groupware.domain.GojiReplyVO;

@Mapper
public interface GojiReplyMapper {
	
	public void writeReply(GojiReplyVO vo) throws Exception;
	
	public List<GojiReplyVO> readReply(int bno) throws Exception;
	
	// 댓글삭제 
	public int deleteReply(int bno) throws Exception;
	
}
