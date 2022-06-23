package com.team.groupware.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.groupware.domain.Criteria;
import com.team.groupware.domain.GojiBoard;
import com.team.groupware.domain.SearchCriteria;
import com.team.groupware.mapper.GojiMapper;
import com.team.groupware.util.FileUtils;

@Service
public class GojiServiceImpl implements GojiService {
	
	@Autowired
	private GojiMapper dao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public void write(GojiBoard vo, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(vo);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest);
		int size = list.size();
		for(int i = 0; i < size; i++) {
			dao.insertFile(list.get(i));
		}
	}

	@Override
	public List<GojiBoard> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	@Override
	public GojiBoard read(int bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public void update(GojiBoard vo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.update(vo);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(vo, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			}else {
				dao.updateFile(tempMap);
			}
		}
	}

	@Override
	public void viewCount(int bno) {
		dao.viewCount(bno);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return dao.selectFileList(bno);
	}

	@Override
	public List<GojiBoard> newlist() throws Exception {
		return dao.newlist();
	}

}
