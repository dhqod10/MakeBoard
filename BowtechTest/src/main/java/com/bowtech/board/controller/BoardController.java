package com.bowtech.board.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bowtech.board.model.BoardDto;
import com.bowtech.board.model.ComentDto;
import com.bowtech.board.model.FileDto;
import com.bowtech.board.service.BoardService;
import com.bowtech.board.service.ComentService;
import com.bowtech.board.service.FileService;
import com.bowtech.board.service.Paging;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private FileService fileService;
	@Autowired
	private ComentService comService;
	private String savePath = "C:/source/BowtechTest/src/main/webapp/fileUpload/";
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main(@ModelAttribute BoardDto board, Model model, String pageNum) {
		int total = boardService.boardTot();
		Paging paging = new Paging(total, pageNum, 10, 5);
		if(board.getStartRow()==0) {
			board.setStartRow(paging.getStartRow());
		}
		if(board.getEndRow()==0) {
			board.setEndRow(paging.getEndRow());
		}
		model.addAttribute("boardTot",boardService.boardTot());
		model.addAttribute("boardMainTot",boardService.boardMainTot());
		model.addAttribute("paging",paging);
		model.addAttribute("boardList",boardService.boardList(board));
		
		model.addAttribute("boardMainTotTest",boardService.boardMainTotTest(board));
		return "board/main";
	}
	@RequestMapping(value="main", method=RequestMethod.POST)
	public String mainPost(@ModelAttribute BoardDto board, Model model, String pageNum) {
		int total = boardService.boardTot();
		Paging paging = new Paging(total, pageNum, 10, 5);
		if(board.getStartRow()==0) {
			board.setStartRow(paging.getStartRow());
		}
		if(board.getEndRow()==0) {
			board.setEndRow(paging.getEndRow());
		}
		model.addAttribute("boardTot",boardService.boardTot());
		model.addAttribute("boardMainTot",boardService.boardMainTot());
		model.addAttribute("paging",paging);
		model.addAttribute("boardList",boardService.boardList(board));
		return "board/main";
	}
	@RequestMapping(value="boardWriteForm", method=RequestMethod.GET)
	public String boardWriteForm(String pageNum, Model model) {
		model.addAttribute("pageNum",pageNum);
		return "board/boardWriteForm";
	}
	@RequestMapping(value="boardWrite", method=RequestMethod.POST)
	public String boardWrite(MultipartHttpServletRequest request, @ModelAttribute FileDto fileDto, @ModelAttribute BoardDto board, Model model) {
		try {
			System.out.println(board.toString());
			boardService.boardWrite(board);
			fileService.fileUp(request, fileDto);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "forward:main.do";
	}
	@RequestMapping(value="boardDetail", method=RequestMethod.GET)
	public String boardDetail(String pageNum, @ModelAttribute ComentDto coment, @ModelAttribute FileDto file, @ModelAttribute BoardDto board, Model model) {
		boardService.boardHit(board);
		file.setbNum(board.getbNum());
		coment.setbNum(board.getbNum());
		model.addAttribute("comentList",comService.comentList(coment));
		model.addAttribute("boardDetail",boardService.boardDetail(board));
		model.addAttribute("fileList",fileService.fileList(file));
		return "board/boardDetail";
	}
	@RequestMapping(value="pwChkModify", method=RequestMethod.GET)
	public String pwChkModify(Model model, @ModelAttribute BoardDto board) {
		model.addAttribute("bPw",board.getbPw());
		return "board/pwChkModify";
	}
	
	@RequestMapping(value="pwChkDelete", method=RequestMethod.GET)
	public String pwChkDelete() {
		return "board/pwChkDelete";
	}
	
	//파일 다운로드 하는 메소드
	@RequestMapping(value="boardFileDownload", method=RequestMethod.GET)
	public void boardFileDownload(HttpServletResponse response, @ModelAttribute FileDto file) throws IOException {
		file = fileService.fileDetail(file);
		String storedFileName = file.getfStore_Name();
	    String originalFileName = file.getfOrigin_Name();
	    byte fileByte[] = FileUtils.readFileToByteArray(new File(savePath+storedFileName));
	    response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
	
	//게시글 수정 폼으로 이동.
	@RequestMapping(value="boardModifyForm", method=RequestMethod.GET)
	public String boardModifyForm(String pageNum, Model model, @ModelAttribute BoardDto board, @ModelAttribute FileDto file) {
		file.setbNum(board.getbNum());
		model.addAttribute("boardDetail",boardService.boardDetail(board));
		model.addAttribute("fileList",fileService.fileList(file));
		return "board/boardModifyForm";
	}
	
	//게시글 수정하기.
	@RequestMapping(value="boardModify", method=RequestMethod.POST)
	public String boardModify(String[] fNum, MultipartHttpServletRequest request, @ModelAttribute FileDto file, @ModelAttribute BoardDto board, Model model, String pageNum) {
		//수정 순서
		//0.파일을 제외한 작성자,제목,내용은 수정해준다.
		//1.원 글에 해당되는 모든 파일을 삭제상태로 만든다.
		//2.넘어온 파일들을 새로 등록해준다.
		//3.수정되지 않은 fNum들이 배열 상태로 넘어오는데, 이 넘어온 것들은 삭제상태를 취소해준다.(file이 null 값일 경우).
		/*for(int i=0; i<fNum.length; i++) {
			System.out.println("["+i+"번째]fNum = "+fNum[i]);			
		}
		System.out.println("fileDto = "+file.toString());
		System.out.println("boardDto = "+board.toString());*/
		fileService.fileDelete(file); //1번.
		boardService.boardModify(board);//0번.
		try {
			fileService.fileModify(request, file); //2번.넘어 온 파일들을 등록해준다.
			for(int i=0; i<fNum.length; i++) { //3번. 수정되지 않은 파일은 다시 상태를 정상으로 바꾼다.
				file.setfNum(Integer.parseInt(fNum[i]));
				fileService.fileDeleteCancle(file);
			}
		}catch(Exception e) {
			System.out.println("파일 등록 에러 : "+e.getMessage());
		}
		return "forward:main.do";
	}
	
	//글 삭제 상태로 만들기.
	@RequestMapping(value="boardDelete", method=RequestMethod.GET)
	public String boardDelete(Model model, @ModelAttribute BoardDto board, String pageNum) {
		boardService.boardDelete(board);
		model.addAttribute("pageNum",pageNum);
		return "forward:main.do";
	}
	
	//답변 글 작성 폼으로.
	@RequestMapping(value="boardReplyForm", method=RequestMethod.GET)
	public String boardReplyForm(Model model, @ModelAttribute BoardDto board, String pageNum) {
		model.addAttribute("boardDetail",boardService.boardDetail(board)); //원 글의 정보를 갖고오자.		
		model.addAttribute("pageNum",pageNum);
		return "board/boardReplyForm";
	}
	
	//답변글 작성하기.
	@RequestMapping(value="boardReply", method=RequestMethod.POST)
	public String boardReply(MultipartHttpServletRequest request, @ModelAttribute FileDto fileDto, Model model, @ModelAttribute BoardDto board, String pageNum) {
		boardService.boardStepUp(board);
		boardService.boardReply(board);
		try {
			fileService.fileUp(request, fileDto);		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		model.addAttribute("pageNum",pageNum);
		return "forward:main.do";
	}
	
	//댓글 입력하기.
	@RequestMapping(value="comentWriteAjax", method=RequestMethod.GET)
	public String comentWriteAjax(Model model, @ModelAttribute ComentDto coment, String pageNum) {
		String cName = URLDecoder.decode(coment.getcName());
		String cContent = URLDecoder.decode(coment.getcContent());
		String cPw = URLDecoder.decode(coment.getcPw());
		coment.setcName(cName);
		coment.setcContent(cContent);
		coment.setcPw(cPw);
		comService.comentWrite(coment);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("comentList",comService.comentList(coment));
		return "board/comentWriteAjax";
	}
	
	//댓글 삭제하기.
	@RequestMapping(value="commentDeleteAjax", method=RequestMethod.GET)
	public String commentDeleteAjax(Model model, @ModelAttribute ComentDto coment, String pageNum) {
		comService.comentDelete(coment);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("comentList",comService.comentList(coment));
		return "board/commentDeleteAjax";
	}
	
	//이름으로 검색하기.
	@RequestMapping(value="searchName", method=RequestMethod.GET)
	public String searchName(Model model, @ModelAttribute BoardDto board, String pageNum) {
		String searchValue = URLDecoder.decode(board.getSearchValue());
		board.setSearchValue(searchValue);
		int total = boardService.searchNameTot(board);
		if(pageNum=="" || pageNum==null) {
			pageNum = "1";
		}
		Paging paging = new Paging(total, pageNum, 10, 5);
		if(board.getStartRow()==0) {
			board.setStartRow(paging.getStartRow());
		}
		if(board.getEndRow()==0) {
			board.setEndRow(paging.getEndRow());
		}		
		model.addAttribute("searchValue",searchValue); //검색어를 띄워줘야 하기 때문에 보내주기.
		model.addAttribute("paging",paging); //페이징처리 필요.
		model.addAttribute("searchNameMainTot",boardService.searchNameMainTot(board)); //게시판 글 번호를 원 글에만 주기위해 보내는 변수.
		model.addAttribute("searchName",boardService.searchName(board)); //작성자로 검색한 게시글 리스트.
		model.addAttribute("searchNameTot",boardService.searchNameTot(board)); //작성자로 검색한 게시글의 총 갯수.
		return "board/searchName";
	}
	
	//제목으로 검색하기.
	@RequestMapping(value="searchTitle", method=RequestMethod.GET)
	public String searchTitle(Model model, @ModelAttribute BoardDto board, String pageNum) {
		String searchValue = URLDecoder.decode(board.getSearchValue());
		board.setSearchValue(searchValue);
		int total = boardService.searchTitleTot(board);
		if(pageNum=="" || pageNum==null) {
			pageNum = "1";
		}
		Paging paging = new Paging(total, pageNum, 10, 5);
		if(board.getStartRow()==0) {
			board.setStartRow(paging.getStartRow());
		}
		if(board.getEndRow()==0) {
			board.setEndRow(paging.getEndRow());
		}
		model.addAttribute("searchValue",searchValue); //검색어를 띄워줘야 하기 때문에 보내주기.
		model.addAttribute("paging",paging); //페이징처리 필요.
		model.addAttribute("searchTitleMainTot",boardService.searchTitleMainTot(board)); //게시판 글 번호를 원 글에만 주기위해 보내는 변수.
		model.addAttribute("searchTitle",boardService.searchTitle(board)); //작성자로 검색한 게시글 리스트.
		model.addAttribute("searchTitleTot",boardService.searchTitleTot(board)); //작성자로 검색한 게시글의 총 갯수.
		return "board/searchTitle";
	}
	
	//작성자+제목으로 검색하기.
	@RequestMapping(value="searchNameTitle", method=RequestMethod.GET)
	public String searchNameTitle(Model model, @ModelAttribute BoardDto board, String pageNum) {
		String searchValue = URLDecoder.decode(board.getSearchValue());
		board.setSearchValue(searchValue);
		int total = boardService.searchNameTitleTot(board);
		if(pageNum=="" || pageNum==null) {
			pageNum = "1";
		}
		Paging paging = new Paging(total, pageNum, 10, 5);
		if(board.getStartRow()==0) {
			board.setStartRow(paging.getStartRow());
		}
		if(board.getEndRow()==0) {
			board.setEndRow(paging.getEndRow());
		}
		model.addAttribute("searchValue",searchValue); //검색어를 띄워줘야 하기 때문에 보내주기.
		model.addAttribute("paging",paging); //페이징처리 필요.
		model.addAttribute("searchNameTitleMainTot",boardService.searchNameTitleMainTot(board)); //게시판 글 번호를 원 글에만 주기위해 보내는 변수.
		model.addAttribute("searchNameTitle",boardService.searchNameTitle(board)); //작성자로 검색한 게시글 리스트.
		model.addAttribute("searchNameTitleTot",boardService.searchNameTitleTot(board)); //작성자로 검색한 게시글의 총 갯수.
		return "board/searchNameTitle";
	}
}
