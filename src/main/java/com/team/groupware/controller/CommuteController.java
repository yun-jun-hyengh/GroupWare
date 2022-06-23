package com.team.groupware.controller;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.team.groupware.service.CommuteService;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService service;
	
	@PostMapping("/getToWork")
	public String getToWork() {
		Calendar c = Calendar.getInstance();
		//int hour = c.get()
		return "redirect:/main";
	}

}
