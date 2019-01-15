package com.bowtech.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bowtech.board.dao.BoardDao;
import com.bowtech.board.model.BoardDto;
@Service
public class BoardService implements IBoardService {
	@Autowired
	private BoardDao boardDao;
	@Override
	public List<BoardDto> boardList(BoardDto board) {
		return boardDao.boardList(board);
	}

	@Override
	public int boardTot() {
		return boardDao.boardTot();
	}

	@Override
	public int boardMainTot() {
		return boardDao.boardMainTot();
	}

	@Override
	public BoardDto boardDetail(BoardDto board) {
		return boardDao.boardDetail(board);
	}

	@Override
	public int boardWrite(BoardDto board) {
		return boardDao.boardWrite(board);
	}

	@Override
	public int boardStepUp(BoardDto board) {
		return boardDao.boardStepUp(board);
	}

	@Override
	public int boardReply(BoardDto board) {
		board.setbGroup(board.getbGroup());
		board.setbParentNum(board.getbNum());
		board.setbStep(board.getbStep()+1);
		board.setbIndent(board.getbIndent()+1);
		return boardDao.boardReply(board);
	}

	@Override
	public int boardModify(BoardDto board) {
		return boardDao.boardModify(board);
	}

	@Override
	public int boardDelete(BoardDto board) {
		return boardDao.boardDelete(board);
	}

	@Override
	public int boardHit(BoardDto board) {
		return boardDao.boardHit(board);
	}

	@Override
	public List<BoardDto> searchName(BoardDto board) {
		return boardDao.searchName(board);
	}

	@Override
	public int searchNameTot(BoardDto board) {
		return boardDao.searchNameTot(board);
	}

	@Override
	public int searchNameMainTot(BoardDto board) {
		return boardDao.searchNameMainTot(board);
	}
	
	@Override
	public List<BoardDto> searchTitle(BoardDto board) {
		return boardDao.searchTitle(board);
	}

	@Override
	public int searchTitleTot(BoardDto board) {
		return boardDao.searchTitleTot(board);
	}

	@Override
	public int searchTitleMainTot(BoardDto board) {
		return boardDao.searchTitleMainTot(board);
	}

	@Override
	public List<BoardDto> searchNameTitle(BoardDto board) {
		return boardDao.searchNameTitle(board);
	}

	@Override
	public int searchNameTitleTot(BoardDto board) {
		return boardDao.searchNameTitleTot(board);
	}


	@Override
	public int searchNameTitleMainTot(BoardDto board) {
		return boardDao.searchNameTitleMainTot(board);
	}

	@Override
	public int boardMainTotTest(BoardDto board) {
		return boardDao.boardMainTotTest(board);
	}

	

}
