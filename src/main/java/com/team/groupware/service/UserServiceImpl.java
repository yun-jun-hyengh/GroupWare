package com.team.groupware.service;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.team.groupware.domain.MemberVO;
import com.team.groupware.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper dao;

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public String find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String memberId = dao.find_id(email);
		
		if(memberId == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return memberId;
		}
	}

	@Override
	public void memberUpdate(MemberVO vo, HttpServletRequest request) throws Exception {
		MultipartRequest mpRequest = (MultipartRequest) request;
		MultipartFile imageFile = mpRequest.getFile("img");
		
		String path = "C:\\upload";
		File dir = new File(path);
		if(dir.exists() == false) {
			dir.mkdir();
		}
		
		String fileName = imageFile.getOriginalFilename();
		System.out.println(fileName);
		if("".equals(fileName) == false) {
			File dest = new File(path, fileName);
			imageFile.transferTo(dest);
			vo.setImage(fileName);
		}
		dao.memberUpdate(vo);
	}

	@Override
	public MemberVO selectMember(String email) throws Exception {
		return dao.selectMember(email);
	}

	@Override
	public void pwUpdate_M(MemberVO vo) throws Exception {
		dao.pwUpdate_M(vo);
	}

}
