package com.team.groupware.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.groupware.domain.CommuteVO;
import com.team.groupware.domain.MemberVO;
import com.team.groupware.service.CommuteService;
import com.team.groupware.service.FreeService;
import com.team.groupware.service.GojiService;
import com.team.groupware.service.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private GojiService goji;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private CommuteService commute;
	
	@Autowired
	private FreeService frservice;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/main")
	public String main(Model model, Model model1) throws Exception {
		model.addAttribute("list", goji.newlist());
		model1.addAttribute("frlist", frservice.freenewlist());
		return "main";
	}
	
	// 로그인
	@PostMapping("/login")
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr, Model model) throws Exception{
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		
		boolean passMatch = passwordEncoder.matches(vo.getPwd(), login.getPwd());
		if(login != null && passMatch == true) {
			session.setAttribute("member", login);
			model.addAttribute("list", goji.newlist());
			return "main";
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}
		return "redirect:/";
	}
	
	// 로그아웃 
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	// 아이디 찾기 화면 
	@GetMapping("/member/findidView")
	public void findId() {
		
	}
	
	// 아이디 찾기 
	@PostMapping("/member/find_Id")
	public String find_id(HttpServletResponse response, @RequestParam("email") String email,
			Model md) throws Exception{
		md.addAttribute("memberId", service.find_id(response, email));
		return "member/find_id";
	}
	
	// 마이페이지 오픈
	@GetMapping("/member/profile")
	public void memberView() throws Exception {
		
	}
	
	// 내정보 수정
	@PostMapping("/member/updatemember")
	public String registerUpdateView(MemberVO memberVO, HttpSession session, HttpServletRequest request) throws Exception{
		service.memberUpdate(memberVO,request);
		session.invalidate();
		return "redirect:/";
	}
	
	// 비번찾기 뷰 
	@GetMapping("/member/findpwView")
	public void findpwView() {
		
	}
	
	/*@PostMapping("/member/pw_auth")
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = (String) request.getParameter("email");
		String name = (String) request.getParameter("name");
		
		MemberVO vo = service.selectMember(email);
		if(vo != null) {
			
		}
		
		//return mav;
	}*/
	
	@PostMapping("/member/pw_auth")
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = (String)request.getParameter("email");
		String name = (String)request.getParameter("name");

		MemberVO vo = service.selectMember(email);
			
		if(vo != null) {
		Random r = new Random();
		int num = r.nextInt(999999); // 랜덤난수설정
		
		if (vo.getName().equals(name)) {
			session.setAttribute("email", vo.getEmail());

			String setfrom = "skyyrt1013@gmail.com"; // 구글 
			String tomail = email; //받는사람
			String title = "비밀번호변경 인증 이메일 입니다"; 
			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
					+ "비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 

			try {
				MimeMessage message = javaMailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title);
				messageHelper.setText(content); 

				javaMailSender.send(message);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/pw_auth");
			mv.addObject("num", num);
			return mv;
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/pw_find");
			return mv;
		}
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/pw_find");
			return mv;
		}
	}
	
	// 인증번호 동일 확인
	@RequestMapping(value="/member/pw_set", method=RequestMethod.POST)
	public String pw_set(@RequestParam(value="email_injeung") String email_injeung,
			@RequestParam(value="num") String num) throws IOException {
		if(email_injeung.equals(num)) {
			return "member/pw_new";
		} else {
			return "member/pw_find";
		}
	}
	
	@PostMapping("/member/pw_new")
	public String pw_new(MemberVO vo, HttpSession session) throws Exception {
		/*
		 * String inputPass = vo.getPwd();
		String pass = passwordEncoder.encode(inputPass);
		vo.setPwd(pass);
		service.register(vo);
		return "redirect:/admin/home";
		 */
		String inputPass = vo.getPwd();
		String pass = passwordEncoder.encode(inputPass);
		vo.setPwd(pass);
		service.pwUpdate_M(vo);
		return "redirect:/";
	}
	
	// 개인 근태내역 조회 
	@GetMapping("/member/commute")
	public String commute(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("member");
		String memberid = login.getMemberId();
		
		List<CommuteVO> list = commute.mycommute(memberid);
		model.addAttribute("list", list);
		return "member/commute";
	}

	@GetMapping("/member/rule")
	public void findRule() {
		
	}
		
}
