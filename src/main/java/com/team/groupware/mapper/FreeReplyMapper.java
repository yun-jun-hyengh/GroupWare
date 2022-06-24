package com.team.groupware.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.groupware.domain.FreeReplyVO;


@Mapper
public interface FreeReplyMapper {
	public void writeReply(FreeReplyVO vo) throws Exception;
	
	public List<FreeReplyVO> readReply(int bno) throws Exception;
	
	// 댓글삭제 
	public int deleteReply(int bno) throws Exception;
}
