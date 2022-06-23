package com.team.groupware.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.groupware.domain.MessageVO;
import com.team.groupware.mapper.MessageMapper;
import com.team.groupware.util.MessageFileUtils;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageMapper mapper;
	
	@Resource(name="messagefileUtils")
	private MessageFileUtils fileUtils;

	@Override
	public void sendMessage(MessageVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		mapper.sendMessage(vo);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest);
		int size = list.size();
		for(int i = 0; i < size; i++) {
			mapper.insertFile(list.get(i));
		}
	}
	
	// 수신함
	@Override
	public List<MessageVO> selectMessagelist(String receiveId) throws Exception {
		return mapper.selectMessagelist(receiveId);
	}

	@Override
	public List<MessageVO> receiveMessagelist(String sendId) throws Exception {
		return mapper.receiveMessagelist(sendId);
	}

	@Override
	public MessageVO read(int msgnum) throws Exception {
		return mapper.read(msgnum);
	}

	@Override
	public List<Map<String, Object>> selectFilelist(int msgnum) throws Exception {
		return mapper.selectFilelist(msgnum);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return mapper.selectFileInfo(map);
	}

}
