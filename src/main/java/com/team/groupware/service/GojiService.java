package com.team.groupware.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.groupware.domain.Criteria;
import com.team.groupware.domain.GojiBoard;
import com.team.groupware.domain.SearchCriteria;

public interface GojiService {
	public void write(GojiBoard vo, MultipartHttpServletRequest mpRequest) throws Exception;
	
	public List<GojiBoard> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public GojiBoard read(int bno) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	public void update(GojiBoard vo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	
	public void viewCount(int bno);
	
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	public List<GojiBoard> newlist() throws Exception;
	
}
