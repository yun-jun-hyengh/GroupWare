package com.team.groupware.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.groupware.domain.SearchCriteria;
import com.team.groupware.domain.WorkVO;

public interface WorkService {
	public void write(WorkVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
	public List<WorkVO> worklist(SearchCriteria scri) throws Exception;
	public int listCount(SearchCriteria scri) throws Exception;
	public WorkVO read(int bno) throws Exception;
	public void delete(int bno) throws Exception;
	public void update(WorkVO vo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
}
