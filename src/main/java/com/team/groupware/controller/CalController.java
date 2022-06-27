package com.team.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CalController {
	
	@GetMapping("fullCal/calendar")
	public void calendar() {
		
	}
	@GetMapping("fullCal/calendarWrite")
	public void calendarWrite() {
		
	}
}
