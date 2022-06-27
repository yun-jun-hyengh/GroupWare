package com.team.groupware.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.groupware.domain.Anonymousboard;
import com.team.groupware.domain.PageMaker;
import com.team.groupware.domain.SearchCriteria;
import com.team.groupware.service.AnonymousService;

@Controller
public class AnonymousController {
	@Autowired
	private AnonymousService service;
	
//	@Autowired
//	private AnonymousReService re_service;
	
	// 작성화면
	@GetMapping("/anonymous/writer")
	public void anonymous(HttpSession session, Model model) {
		Object loginInfo = session.getAttribute("member");
		if(loginInfo == null) {
			model.addAttribute("msg", false);
		}
	}
	
	// 글작성
	@PostMapping("/anonymous/writer")
	public String postanonymousboard(Anonymousboard vo, MultipartHttpServletRequest mpRequest) throws Exception {
		service.write(vo, mpRequest);			
		return "redirect:/anonymous/anonymouslist";
	}
	
	// 글 목록
	@GetMapping("/anonymous/anonymouslist")
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		model.addAttribute("anonymouslist", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);
		return "anonymous/anonymouslist";
	}
	
	// view
	@GetMapping("/anonymous/view")
	public void getRead(@RequestParam("bno") int bno, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		Anonymousboard vo = service.read(bno);
		model.addAttribute("read", vo);
		model.addAttribute("scri", scri);
		service.viewCount(vo.getBno());
		
		List<Map<String, Object>> fileList = service.selectFileList(vo.getBno());
		model.addAttribute("anonymousfile", fileList);
	}
	
}
