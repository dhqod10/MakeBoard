package com.bowtech.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.bowtech.board.model.BoardDto;

@Repository
public class BoardDao implements IBoardDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	//게시글 목록 갖고오기
	@Override
	public List<BoardDto> boardList(BoardDto board) {
		return sessionTemplate.selectList("boardList",board);
	}
	//게시글 총 갯수 갖고오기
	@Override
	public int boardTot() {
		return sessionTemplate.selectOne("boardTot");
	}
	//게시글 원글 갯수 갖고오기
	@Override
	public int boardMainTot() {
		return sessionTemplate.selectOne("boardMainTot");
	}
	//게시글 상세보기
	@Override
	public BoardDto boardDetail(BoardDto board) {
		return sessionTemplate.selectOne("boardDetail",board);
	}
	//게시글 쓰기
	@Override
	public int boardWrite(BoardDto board) {
		return sessionTemplate.insert("boardWrite",board);
	}
	//게시글 step 올리기
	@Override
	public int boardStepUp(BoardDto board) {
		return sessionTemplate.update("boardStepUp",board);
	}
	//게시글 답변달기
	@Override
	public int boardReply(BoardDto board) {
		return sessionTemplate.insert("boardReply",board);
	}
	//게시글 수정하기
	@Override
	public int boardModify(BoardDto board) {
		return sessionTemplate.update("boardModify",board);
	}
	//게시글 삭제처리하기
	@Override
	public int boardDelete(BoardDto board) {
		return sessionTemplate.update("boardDelete",board);
	}
	//게시글 조회수 올리기
	@Override
	public int boardHit(BoardDto board) {
		return sessionTemplate.update("boardHit",board);
	}
	@Override
	public List<BoardDto> searchName(BoardDto board) {
		return sessionTemplate.selectList("searchName",board);
	}
	@Override
	public int searchNameTot(BoardDto board) {
		return sessionTemplate.selectOne("searchNameTot",board);
	}
	@Override
	public int searchNameMainTot(BoardDto board) {
		return sessionTemplate.selectOne("searchNameMainTot",board);
	}
	@Override
	public List<BoardDto> searchTitle(BoardDto board) {
		return sessionTemplate.selectList("searchTitle",board);
	}
	@Override
	public int searchTitleTot(BoardDto board) {
		return sessionTemplate.selectOne("searchTitleTot",board);
	}
	
	@Override
	public int searchTitleMainTot(BoardDto board) {
		return sessionTemplate.selectOne("searchTitleMainTot",board);
	}
	@Override
	public List<BoardDto> searchNameTitle(BoardDto board) {
		return sessionTemplate.selectList("searchNameTitle",board);
	}
	@Override
	public int searchNameTitleTot(BoardDto board) {
		return sessionTemplate.selectOne("searchNameTitleTot",board);
	}
	
	@Override
	public int searchNameTitleMainTot(BoardDto board) {
		return sessionTemplate.selectOne("searchNameTitleMainTot",board);
	}
	@Override
	public int boardMainTotTest(BoardDto board) {
		return sessionTemplate.selectOne("boardMainTotTest",board);
	}
	
}
