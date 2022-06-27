package com.team.groupware.service;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.groupware.domain.Anonymousboard;
import com.team.groupware.domain.Freeboard;
import com.team.groupware.domain.GojiBoard;
import com.team.groupware.domain.SearchCriteria;
import com.team.groupware.mapper.AnonymousMapper;
import com.team.groupware.util.AnonymousFileUtils;

@Service
public class AnonymousServiceImpl implements AnonymousService{

	@Autowired
	private AnonymousMapper dao;
	
	@Resource(name="anonymousfileUtils")
	private AnonymousFileUtils anonymousfileUtils;

	@Override
	public void write(Anonymousboard vo, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(vo);
		
		List<Map<String, Object>> list = anonymousfileUtils.parseInsertFileInfo(vo, mpRequest);
		int size = list.size();
		for(int i = 0; i < size; i++) {
			dao.insertFile(list.get(i));
		}
	}

	@Override
	public List<Anonymousboard> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	@Override
	public Anonymousboard read(int bno) throws Exception {
		return dao.read(bno);
	}

/*	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public void update(Anonymousboard vo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.update(vo);
		
		List<Map<String, Object>> list = anonymousfileUtils.parseUpdateFileInfo(vo, files, fileNames, mpRequest);
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
*/
	@Override
	public void viewCount(int bno) {
		dao.viewCount(bno);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return dao.selectFileList(bno);
	}

	@Override
	public List<Anonymousboard> newlist() throws Exception {
		return dao.newlist();
	}
}
