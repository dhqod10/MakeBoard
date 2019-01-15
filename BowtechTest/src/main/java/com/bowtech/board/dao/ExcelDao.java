package com.bowtech.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bowtech.board.model.BoardDto;
@Repository
public class ExcelDao implements IExcelDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public List<Object> excelDownloadListAll(Map<String, Object> searchMap, BoardDto board) {
		return sessionTemplate.selectList("excelDownloadListAll", board);
	}

	@Override
	public List<Object> excelDownloadNowPage(Map<String, Object> searchMap, BoardDto board) {
		return sessionTemplate.selectList("excelDownloadNowPage", board);
	}

}
