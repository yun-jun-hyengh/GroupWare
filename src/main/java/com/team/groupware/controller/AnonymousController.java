package com.team.groupware.controller;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.groupware.domain.Anonymousboard;
import com.team.groupware.domain.FreeReplyVO;
import com.team.groupware.domain.Freeboard;
import com.team.groupware.domain.PageMaker;
import com.team.groupware.domain.SearchCriteria;
import com.team.groupware.service.AnonymousService;
import com.team.groupware.service.FreeReService;
import com.team.groupware.service.FreeService;

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
		
//		List<FreeReplyVO> replyList = re_service.readReply(vo.getBno());
//		model.addAttribute("anonymousreplyList", replyList);
		
		List<Map<String, Object>> fileList = service.selectFileList(vo.getBno());
		model.addAttribute("anonymousfile", fileList);
	}
	
	// 글삭제 
/*	@PostMapping("/free/delete")
	public String delete(Freeboard vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		service.delete(vo.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/anonymous/anonymouslist";
	}
	
	// 게시판 수정view
	@GetMapping("/free/updateView")
	public String updateView(Freeboard vo, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		model.addAttribute("update", service.read(vo.getBno()));
		model.addAttribute("scri", scri);
		
		List<Map<String, Object>> fileList = service.selectFileList(vo.getBno());
		model.addAttribute("freefile", fileList);
		return "free/updateView";
	}
	
	// 게시판 수정
	@PostMapping("/free/update")
	public String update(Freeboard vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr,
			@RequestParam(value="fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]") String[] fileNames,
			MultipartHttpServletRequest mpRequest) throws Exception {
		service.update(vo, files, fileNames, mpRequest);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/free/freelist";
	}
	
	// 댓글 작성
	@PostMapping("/anonymous/replyWrite")
	public String replyWrite(anonymousReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		re_service.writeReply(vo);
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/anonymous/view";
	}
	
	// 댓글 삭제 
	@RequestMapping(value="/anonymous/deleteReply/{bno}", method=RequestMethod.GET)
	public String deleteReply(@PathVariable("bno") int bno, @RequestHeader("referer") String referer) throws Exception {
		re_service.deleteReply(bno);
		return "redirect:" + referer;
	}
	*/
}
