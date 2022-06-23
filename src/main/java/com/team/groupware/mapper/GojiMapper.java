package com.team.groupware.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team.groupware.domain.GojiBoard;
import com.team.groupware.domain.SearchCriteria;

@Mapper
public interface GojiMapper {
	public void write(GojiBoard vo) throws Exception;
	
	public List<GojiBoard> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public GojiBoard read(int bno) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	public void update(GojiBoard vo) throws Exception;
	
	public void viewCount(int bno);
	
	public void insertFile(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	public List<GojiBoard> newlist() throws Exception;
	
	// 파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
}
