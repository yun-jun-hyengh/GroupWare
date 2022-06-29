package com.team.groupware.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.groupware.domain.SearchCriteria;
import com.team.groupware.domain.WorkVO;
import com.team.groupware.mapper.WorkMapper;
import com.team.groupware.util.WorkFileUtils;

@Service
public class WorkServiceImpl implements WorkService {
	
	@Autowired
	private WorkMapper dao;
	
	@Resource(name="workfileUtils")
	private WorkFileUtils workfileUtils;

	@Override
	public void write(WorkVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(vo);
		
		List<Map<String, Object>> list = workfileUtils.parseInsertFileInfo(vo, mpRequest);
		int size= list.size();
		for(int i = 0; i < size; i++) {
			dao.insertFile(list.get(i));
		}
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
	public void update(WorkVO vo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.update(vo);
		
		List<Map<String, Object>> list = workfileUtils.parseUpdateFileInfo(vo, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i < size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			} else {
				dao.updateFile(tempMap);
			}
		}
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return dao.selectFileList(bno);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return dao.selectFileInfo(map);
	}

}
