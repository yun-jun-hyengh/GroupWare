package com.team.groupware.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.groupware.domain.MemberVO;
import com.team.groupware.domain.MessageVO;
import com.team.groupware.service.MessageService;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService service;
	
	// 보낸메일함
	@GetMapping("/message/sendlist")
	public String send() {
		return "message/sendlist";
	}
	
	// 메일 쓰기 화면 
	@GetMapping("/message/writer")
	public void writer(HttpSession session, Model model) {
		Object loginInfo = session.getAttribute("member");
		if(loginInfo == null) {
			model.addAttribute("msg", false);
		}
	}
	
	// 메일작성 post
	@PostMapping("/message/writer")
	public String writer(MessageVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		service.sendMessage(vo, mpRequest);
		return "redirect:/message/sendlist";
	}
	
	// 수신함 리스트
	@GetMapping("/message/relist")
	public String relist(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("member");
		String receiveId = login.getMemberId();
		
		List<MessageVO> messageList = service.selectMessagelist(receiveId);
		model.addAttribute("messageList", messageList);
		return "message/relist";
	}
	
	// 발신함 리스트
	@GetMapping("/message/sendList")
	public String sendlist(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("member");
		String sendId = login.getMemberId();
		
		List<MessageVO> list = service.receiveMessagelist(sendId);
		model.addAttribute("list", list);
		return "message/sendlist";
	}
	
	// 메시지 조회 
	@GetMapping("/message/msgview")
	public void getRead(@RequestParam("msgnum") int msgnum, Model model) throws Exception {
		MessageVO vo = service.read(msgnum);
		model.addAttribute("read", vo);
		
		List<Map<String, Object>> file = service.selectFilelist(vo.getMsgnum());
		model.addAttribute("file", file);
	}
	
	// 파일 다운로드
	@RequestMapping("/message/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\upload\\"+storedFileName));
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

}
