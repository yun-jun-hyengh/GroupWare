package com.team.groupware.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.groupware.domain.MessageVO;

public interface MessageService {
	
	// 메시지 보내기 
	public void sendMessage(MessageVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 수신함 
	public List<MessageVO> selectMessagelist(String receiveId) throws Exception;
	
	// 발신함
	public List<MessageVO> receiveMessagelist(String sendId) throws Exception;
	
	// 메시지 읽기
	public MessageVO read(int msgnum) throws Exception;
	
	// 첨부파일 조회 
	public List<Map<String, Object>> selectFilelist(int msgnum) throws Exception;
	
	// 첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
}
