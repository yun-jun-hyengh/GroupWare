package com.team.groupware.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team.groupware.domain.Anonymousboard;
import com.team.groupware.domain.Freeboard;
import com.team.groupware.domain.SearchCriteria;
@Mapper
public interface AnonymousMapper {
	public void write(Anonymousboard vo) throws Exception;
	
	public List<Anonymousboard> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public Anonymousboard read(int bno) throws Exception;
	
//	public void delete(int bno) throws Exception;
	
//	public void update(Anonymousboard vo) throws Exception;
	
	public void viewCount(int bno);
	
	public void insertFile(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	public List<Anonymousboard> newlist() throws Exception;
	
	// 파일 수정
//	public void updateFile(Map<String, Object> map) throws Exception;
}
