package com.bowtech.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bowtech.board.dao.ExcelDao;
import com.bowtech.board.model.BoardDto;
@Service
public class ExcelServiceImpl implements ExcelService {
	@Autowired
	private ExcelDao excelDao;
	@Override
	public List<Object> getAllObjects(String target, Map<String, Object> searchMap, BoardDto board) {
        //controller에서 넘어온 target에 따라서 dao 실행을 구분
        if(target.equals("excelDownloadListAll")){
            return excelDao.excelDownloadListAll(searchMap, board);//검색조건 searchMap를 넘겨줌
        }
 
        if(target.equals("excelDownloadNowPage")){
            return excelDao.excelDownloadNowPage(searchMap, board);//검색조건 searchMap를 넘겨줌
        } 
        return null;
	}
}
