package com.team.groupware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.team.groupware.domain.CalendarVO;
import com.team.groupware.service.CalendarService;

@Controller
public class CalController {
	
	@Autowired
	private CalendarService service;
	
	@GetMapping("/fullCal/calendarWrite")
	public void calendar() {
		
	}
	@PostMapping("/fullCal/calendarWrite")
	public String calendarWrite(CalendarVO vo) throws Exception {
		service.calinsert(vo);
		return "redirect:/fullCal/calendar";
	}
	
	@GetMapping("/fullCal/calendar")
	public String callist() throws Exception {
		return "fullCal/calendar";
	}
}
