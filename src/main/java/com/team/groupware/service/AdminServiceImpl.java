package com.team.groupware.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.groupware.domain.MemberVO;
import com.team.groupware.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public List<MemberVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public void delete(String memberId) {
		dao.delete(memberId);
	}
	
	@Override
	public int idChk(String memberId) throws Exception {
		int result = dao.idChk(memberId);
		return result;
	}
	
	@Override
	public MemberVO read(String memberId) throws Exception {
		return dao.read(memberId);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		dao.update(vo);
	}
	
	
}
