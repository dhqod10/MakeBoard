package com.bowtech.board.service;

import java.util.List;

import com.bowtech.board.model.BoardDto;

public interface IBoardService {
	public List<BoardDto> boardList(BoardDto board); //게시글 리스트 갖고오기.
	public int boardTot(); //게시글 총 갯수 갖고오기.
	public int boardMainTot(); //게시글 원글 갯수 갖고오기.
	public BoardDto boardDetail(BoardDto board); //게시글 상세보기.
	public int boardWrite(BoardDto board); //게시글 쓰기.
	public int boardStepUp(BoardDto board); //게시글 step올리기.
	public int boardReply(BoardDto board); //게시글 답변달기.
	public int boardModify(BoardDto board); //게시글 수정하기.
	public int boardDelete(BoardDto board); //게시글 삭제처리.
	public int boardHit(BoardDto board); //게시글 조회수 올리기.
	
	public List<BoardDto> searchName(BoardDto board); //작성자 이름으로 검색.
	public int searchNameTot(BoardDto board); //작성자 이름으로 검색시 총 갯수.
	public int searchNameMainTot(BoardDto board); //작성자 이름으로 검색시 원글의 총 갯수.
	
	
	public List<BoardDto> searchTitle(BoardDto board); //글 제목으로 검색.
	public int searchTitleTot(BoardDto board); //제목으로 검색시 총 갯수.
	public int searchTitleMainTot(BoardDto board); //제목으로 검색시 원글의 총 갯수.
	
	public List<BoardDto> searchNameTitle(BoardDto board); //제목 작성자로 검색.
	public int searchNameTitleTot(BoardDto board); //제목 작성자로 검색시 총 갯수.
	public int searchNameTitleMainTot(BoardDto board); //제목 작성자로 검색시 원글의 총 갯수.
	
	
	
	//-----------------------------------------------------TEST-----------------------
	public int boardMainTotTest(BoardDto board);
}
