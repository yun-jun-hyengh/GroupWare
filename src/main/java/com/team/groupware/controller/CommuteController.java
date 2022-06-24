package com.team.groupware.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		service.startinsert(vo);
		return "redirect:/main";
	}
	

}
