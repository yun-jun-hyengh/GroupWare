package com.team.groupware.service;

import java.util.List;

import com.team.groupware.domain.SearchCriteria;
import com.team.groupware.domain.WorkVO;

public interface WorkService {
	public void write(WorkVO vo) throws Exception;
	public List<WorkVO> worklist(SearchCriteria scri) throws Exception;
	public int listCount(SearchCriteria scri) throws Exception;
	public WorkVO read(int bno) throws Exception;
	public void delete(int bno) throws Exception;
	public void update(WorkVO vo) throws Exception;
}
