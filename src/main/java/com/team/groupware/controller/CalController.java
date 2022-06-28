package com.team.groupware.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView getCalendarList(ModelAndView mv, HttpServletRequest request) {
		String viewpage = "fullCal/calendar";
		List<CalendarVO> calendar = null;
		try {
			calendar = service.calendarList();
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	
}
