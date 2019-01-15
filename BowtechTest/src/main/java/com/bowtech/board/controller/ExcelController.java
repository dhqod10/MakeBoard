package com.bowtech.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bowtech.board.model.BoardDto;
import com.bowtech.board.service.ExcelServiceImpl;

@Controller
public class ExcelController {
	@Autowired
    ExcelServiceImpl excelService;
	
	@RequestMapping(value="excelDownload")
	public String excelDownload(@ModelAttribute BoardDto board, @RequestParam Map<String, Object> paramMap, Map<String, Object> ModelMap, HttpServletResponse response) throws Exception {
       String target = paramMap.get("target").toString();
       response.setHeader("Content-disposition", "attachment; filename=" + target + ".xlsx"); //target명을 파일명으로 작성
       System.out.println(paramMap.toString());
       System.out.println(board.toString());
       //엑셀에 작성할 리스트를 가져온다.
       List<Object> excelList= excelService.getAllObjects(target, paramMap, board);
       //ExcelView(kr.co.myapp.util.ExcelView) 에 넘겨줄 값 셋팅
       ModelMap.put("excelList", excelList); 
       ModelMap.put("target", target);       
       return "excelView"; //servlet-context.xml 에서 name이 excelView(kr.co.myapp.util.ExcelView)인것 호출
	}
}
