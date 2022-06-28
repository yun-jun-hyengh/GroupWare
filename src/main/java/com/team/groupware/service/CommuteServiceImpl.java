package com.team.groupware.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.math3.analysis.function.Ceil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.groupware.domain.CommuteVO;
import com.team.groupware.mapper.CommuteMapper;

@Service
public class CommuteServiceImpl implements CommuteService {
	
	@Autowired
	private CommuteMapper mapper;
	
	@Override
	public void startinsert(CommuteVO vo) throws Exception {
		mapper.startinsert(vo);
	}

	@Override
	public List<CommuteVO> staffcommute() throws Exception {
		return mapper.staffcommute();
	}
	
	// 엑셀 다운로드
	@Override
	public void excelDown(CommuteVO vo, HttpServletResponse response) throws Exception {
		List<CommuteVO> list = mapper.staffcommute();
		try {
			Workbook workbook = new HSSFWorkbook();
			Sheet sheet = workbook.createSheet("관리");
			
			Row row = null;
			Cell cell = null;
			int rowNo = 0;
			
			CellStyle headStyle = workbook.createCellStyle();
			
			headStyle.setBorderTop(BorderStyle.THIN);
			headStyle.setBorderBottom(BorderStyle.THIN);
			headStyle.setBorderLeft(BorderStyle.THIN);
			headStyle.setBorderRight(BorderStyle.THIN);
			
			headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
			headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			
			CellStyle bodyStyle = workbook.createCellStyle();
			bodyStyle.setBorderTop(BorderStyle.THIN);
			bodyStyle.setBorderBottom(BorderStyle.THIN);
			bodyStyle.setBorderLeft(BorderStyle.THIN);
			bodyStyle.setBorderRight(BorderStyle.THIN);
			
			// 헤더명
			String[] headerArray = {"아이디","사원이름","출근시간","퇴근시간","근무일자"};
			row = sheet.createRow(rowNo++);
			for(int i = 0; i < headerArray.length; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyle);
				cell.setCellValue(headerArray[i]);
			}
			
			for(CommuteVO excelData : list) {
				row = sheet.createRow(rowNo++);
				
				cell = row.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getMemberId());
				
				cell = row.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getName());
				
				cell = row.createCell(2);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getWorkTime());
				
				cell = row.createCell(3);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getEndTime());
				
				cell = row.createCell(4);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getRegdate());
				
			}
			
			// 컨텐츠 타입과 파일명 지정 
			response.setContentType("ms-vnd/excel");
			response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode("사원 근태관리.xls","UTF-8"));
			workbook.write(response.getOutputStream());
			workbook.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<CommuteVO> mycommute(String memberId) throws Exception {
		return mapper.mycommute(memberId);
	}

}
