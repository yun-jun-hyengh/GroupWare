package com.team.groupware.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team.groupware.domain.Freeboard;
import com.team.groupware.domain.SearchCriteria;
@Mapper
public interface FreeMapper {
	public void write(Freeboard vo) throws Exception;
	
	public List<Freeboard> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public Freeboard read(int bno) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	public void update(Freeboard vo) throws Exception;
	
	public void viewCount(int bno);
	
	public void insertFile(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	public List<Freeboard> freenewlist() throws Exception;
	
	// 파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
}
