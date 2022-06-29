package com.team.groupware.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.groupware.domain.PageMaker;
import com.team.groupware.domain.SearchCriteria;
import com.team.groupware.domain.WorkVO;
import com.team.groupware.service.WorkService;

@Controller
public class WorkController {
	
	@Autowired
	private WorkService service;
	
	// 업무보고 
	@GetMapping("/work/write")
	public void write(HttpSession session, Model model) {
		Object loginInfo = session.getAttribute("member");
		if(loginInfo == null) {
			model.addAttribute("msg", false);
		}
	}
	
	// 보고작성
	@PostMapping("/work/write")
	public String postgoji(WorkVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		service.write(vo, mpRequest);
		return "redirect:/work/write";
	}
	
	// 보고리스트
	@GetMapping("/work/worklist")
	public String worklist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		model.addAttribute("list", service.worklist(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "work/worklist";
	}
	
	// 상세보기
	@GetMapping("/work/workview")
	public void getRead(@RequestParam("bno") int bno, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		WorkVO vo = service.read(bno);
		model.addAttribute("read", vo);
		model.addAttribute("scri", scri);
		
		List<Map<String, Object>> fileList = service.selectFileList(vo.getBno());
		model.addAttribute("file", fileList);
	}
	
	// 삭제
	@PostMapping("/work/delete")
	public String delete(WorkVO vo, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {
		service.delete(vo.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("bgno", scri.getBgno());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/work/worklist";
	}
	
	// 수정 view
	@GetMapping("/work/updateView")
	public String updateView(WorkVO vo, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		model.addAttribute("update", service.read(vo.getBno()));
		model.addAttribute("scri", scri);
		
		List<Map<String, Object>> fileList = service.selectFileList(vo.getBno());
		model.addAttribute("file", fileList);
		return "work/updateView";
	}
	
	// 보고수정
	@PostMapping("/work/update")
	public String update(WorkVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr,
			@RequestParam(value="fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]") String[] fileNames,
			MultipartHttpServletRequest mpRequest) throws Exception {
		service.update(vo, files, fileNames, mpRequest);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("bgno", scri.getBgno());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/work/worklist";
	}
	
	@RequestMapping("/work/fileDown")
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
