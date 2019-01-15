package com.bowtech.board.service;

import java.util.List;
import java.util.Map;

import com.bowtech.board.model.BoardDto;

public interface ExcelService {
	public List<Object> getAllObjects(String target, Map<String, Object> searchMap, BoardDto board);
}
