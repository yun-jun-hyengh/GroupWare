package com.team.groupware.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.groupware.domain.MemberVO;
import com.team.groupware.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
	// 관리자 메인페이지
	@GetMapping("/admin/home")
	public String admin(Model model) throws Exception{
		model.addAttribute("list", service.list());
		return "admin/home";
	}
	
	// 사원등록 페이지 
	@GetMapping("/admin/join")
	public void getRegister() {
		
	}
	
	// 사원등록
	@PostMapping("/admin/join")
	public String postRegister(MemberVO vo) throws Exception{
		String inputPass = vo.getPwd();
		String pass = passwordEncoder.encode(inputPass);
		vo.setPwd(pass);
		service.register(vo);
		return "redirect:/admin/home";
	}
	
	// 사원삭제 
	@ResponseBody
	@RequestMapping(value="/admin/delete")
	public String delete(HttpServletRequest request) {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i  = 0; i < size; i++) {
			service.delete(ajaxMsg[i]);
		}
		return "redirect:/admin/home";
	}
	
	// 사원권한관리페이지 
	@GetMapping("/admin/role")
	public String role(Model model) throws Exception {
		model.addAttribute("list", service.list());
		return "admin/role";
	}
	
	// 사원조회
	@GetMapping("/admin/userModify")
	public String user_pop_up(@RequestParam("memberId") String memberId, Model model) throws Exception {
		MemberVO vo = service.read(memberId);
		model.addAttribute("vo", vo);
		return "admin/userModify";
	}
	
	// 권한변경
	@PostMapping("/admin/update")
	public String update_user(MemberVO vo) throws Exception {
		service.update(vo);
		return "redirect:/admin/role";
	}
	
	// 아이디 중복체크 
	@ResponseBody
	@PostMapping(value="/admin/idChk")
	public String idChk(String memberId) throws Exception{
		int result = service.idChk(memberId);
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}
}
