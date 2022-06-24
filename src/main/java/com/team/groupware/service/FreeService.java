package com.team.groupware.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.groupware.domain.Freeboard;
import com.team.groupware.domain.SearchCriteria;

public interface FreeService {
public void write(Freeboard vo, MultipartHttpServletRequest mpRequest) throws Exception;
	
	public List<Freeboard> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public Freeboard read(int bno) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	public void update(Freeboard vo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	
	public void viewCount(int bno);
	
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	public List<Freeboard> newlist() throws Exception;
}
