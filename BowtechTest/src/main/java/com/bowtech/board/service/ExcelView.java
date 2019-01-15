package com.bowtech.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.bowtech.board.model.BoardDto;

public class ExcelView extends AbstractExcelPOIView {

	@Override
	protected Workbook createWorkbook() {
		return new XSSFWorkbook();
	}

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        String target = model.get("target").toString();
 
        //target에 따라서 엑셀 문서 작성을 분기한다.
        if(target.equals("excelDownloadListAll")){
            //Object로 넘어온 값을 각 Model에 맞게 형변환 해준다.
            List<BoardDto> boardList = (List<BoardDto>) model.get("excelList");
 
            //Sheet 생성
            Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;
 
            // 제목 Cell 생성
            row = sheet.createRow(rowCount++);
 
            row.createCell(cellCount++).setCellValue("글번호");
            row.createCell(cellCount++).setCellValue("작성자");
            row.createCell(cellCount++).setCellValue("제목");
            row.createCell(cellCount++).setCellValue("작성일");
            row.createCell(cellCount++).setCellValue("조회수");
 
            // 데이터 Cell 생성
            for (BoardDto b : boardList) {
                row = sheet.createRow(rowCount++);
                cellCount = 0;
                row.createCell(cellCount++).setCellValue(b.getbNum()); //데이터를 가져와 입력
                row.createCell(cellCount++).setCellValue(b.getbName());
                row.createCell(cellCount++).setCellValue(b.getbTitle());
                row.createCell(cellCount++).setCellValue(b.getbRdate());
                row.createCell(cellCount++).setCellValue(b.getbHit());
            }
        }else if(target.equals("excelDownloadNowPage")) {
        	 //Object로 넘어온 값을 각 Model에 맞게 형변환 해준다.
            List<BoardDto> boardList = (List<BoardDto>) model.get("excelList");
 
            //Sheet 생성
            Sheet sheet = workbook.createSheet(target);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;
 
            // 제목 Cell 생성
            row = sheet.createRow(rowCount++);
 
            row.createCell(cellCount++).setCellValue("글번호");
            row.createCell(cellCount++).setCellValue("작성자");
            row.createCell(cellCount++).setCellValue("제목");
            row.createCell(cellCount++).setCellValue("작성일");
            row.createCell(cellCount++).setCellValue("조회수");
 
            // 데이터 Cell 생성
            for (BoardDto b : boardList) {
                row = sheet.createRow(rowCount++);
                cellCount = 0;
                row.createCell(cellCount++).setCellValue(b.getbNum()); //데이터를 가져와 입력
                row.createCell(cellCount++).setCellValue(b.getbName());
                row.createCell(cellCount++).setCellValue(b.getbTitle());
                row.createCell(cellCount++).setCellValue(b.getbRdate());
                row.createCell(cellCount++).setCellValue(b.getbHit());
            }
        }
	}
}
