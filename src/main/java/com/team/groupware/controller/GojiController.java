package com.team.groupware.controller;

import java.util.HashMap;
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

import com.team.groupware.domain.Criteria;
import com.team.groupware.domain.GojiBoard;
import com.team.groupware.domain.GojiReplyVO;
import com.team.groupware.domain.PageMaker;
import com.team.groupware.domain.SearchCriteria;
import com.team.groupware.service.GojiReService;
import com.team.groupware.service.GojiService;

@Controller
public class GojiController {
	
	@Autowired
	private GojiService service;
	
	@Autowired
	private GojiReService re_service;
	
	// 작성화면
	@GetMapping("/goji/writer")
	public void goji(HttpSession session, Model model) {
		Object loginInfo = session.getAttribute("member");
		if(loginInfo == null) {
			model.addAttribute("msg", false);
		}
	}
	
	// 글작성
	@PostMapping("/goji/writer")
	public String postgoji(GojiBoard vo, MultipartHttpServletRequest mpRequest) throws Exception {
		service.write(vo, mpRequest);
		return "redirect:/goji/gojilist";
	}
	
	// 공지사항 목록
	@GetMapping("/goji/gojilist")
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);
		return "goji/gojilist";
	}
	
	// view
	@GetMapping("/goji/view")
	public void getRead(@RequestParam("bno") int bno, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		GojiBoard vo = service.read(bno);
		model.addAttribute("read", vo);
		model.addAttribute("scri", scri);
		service.viewCount(vo.getBno());
		
		List<GojiReplyVO> replyList = re_service.readReply(vo.getBno());
		model.addAttribute("replyList", replyList);
		
		List<Map<String, Object>> fileList = service.selectFileList(vo.getBno());
		model.addAttribute("file", fileList);
	}
	
	// 글삭제 
	@PostMapping("/goji/delete")
	public String delete(GojiBoard vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		service.delete(vo.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/goji/gojilist";
	}
	
	// 게시판 수정view
	@GetMapping("/goji/updateView")
	public String updateView(GojiBoard vo, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		model.addAttribute("update", service.read(vo.getBno()));
		model.addAttribute("scri", scri);
		
		List<Map<String, Object>> fileList = service.selectFileList(vo.getBno());
		model.addAttribute("file", fileList);
		return "goji/updateView";
	}
	
	// 게시판 수정
	@PostMapping("/goji/update")
	public String update(GojiBoard vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr,
			@RequestParam(value="fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]") String[] fileNames,
			MultipartHttpServletRequest mpRequest) throws Exception {
		service.update(vo, files, fileNames, mpRequest);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/goji/gojilist";
	}
	
	// 댓글 작성
	@PostMapping("/goji/replyWrite")
	public String replyWrite(GojiReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		re_service.writeReply(vo);
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/goji/view";
	}
	
	// 댓글 삭제 
	@RequestMapping(value="/goji/deleteReply/{bno}", method=RequestMethod.GET)
	public String deleteReply(@PathVariable("bno") int bno, @RequestHeader("referer") String referer) throws Exception {
		re_service.deleteReply(bno);
		return "redirect:" + referer;
	}
	
	
}
