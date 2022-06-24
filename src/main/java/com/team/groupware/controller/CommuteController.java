package com.team.groupware.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.team.groupware.domain.CommuteVO;
import com.team.groupware.service.CommuteService;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService service;
	
	@PostMapping("/getToWork")
	public String getToWork(HttpSession session, CommuteVO vo) throws Exception {
		Object loginInfo = session.getAttribute("member");
		// 현재시간 
		//LocalTime now = LocalTime.now();
		//DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH시 mm분 ss초");
		//String formatedNow = now.format(formatter);
		//model.addAttribute("formatedNow", formatedNow);
		service.startinsert(vo);
		return "redirect:/main";
	}
	
	@GetMapping("/commuteread")
	public String read(CommuteVO vo, Model model) throws Exception {
		model.addAttribute("read", service.read(vo.getWorkId()));
		return "/main";
	}
	
	@PostMapping("/endWork")
	public String endWork() throws Exception {
		
		return "redirect:/main";
	}

}
