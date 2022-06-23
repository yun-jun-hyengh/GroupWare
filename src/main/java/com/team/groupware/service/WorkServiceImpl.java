package com.team.groupware.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.groupware.domain.SearchCriteria;
import com.team.groupware.domain.WorkVO;
import com.team.groupware.mapper.WorkMapper;

@Service
public class WorkServiceImpl implements WorkService {
	
	@Autowired
	private WorkMapper dao;

	@Override
	public void write(WorkVO vo) throws Exception {
		dao.write(vo);
	}

	@Override
	public List<WorkVO> worklist(SearchCriteria scri) throws Exception {
		return dao.worklist(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	@Override
	public WorkVO read(int bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public void update(WorkVO vo) throws Exception {
		dao.update(vo);
	}

}
