package com.team.groupware.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team.groupware.domain.SearchCriteria;
import com.team.groupware.domain.WorkVO;

@Mapper
public interface WorkMapper {
	public void write(WorkVO vo) throws Exception;
	public List<WorkVO> worklist(SearchCriteria scri) throws Exception;
	public int listCount(SearchCriteria scri) throws Exception;
	public WorkVO read(int bno) throws Exception;
	public void delete(int bno) throws Exception;
	public void update(WorkVO vo) throws Exception;
	public void insertFile(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	public void updateFile(Map<String, Object> map) throws Exception;
}
