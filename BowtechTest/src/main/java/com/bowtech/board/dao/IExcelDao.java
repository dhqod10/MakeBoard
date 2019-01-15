package com.bowtech.board.dao;

import java.util.List;
import java.util.Map;

import com.bowtech.board.model.BoardDto;

public interface IExcelDao {
	public List<Object> excelDownloadListAll(Map<String, Object> searchMap, BoardDto board);
    
    public List<Object> excelDownloadNowPage(Map<String, Object> searchMap, BoardDto board);
}
