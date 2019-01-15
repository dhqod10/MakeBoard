package com.bowtech.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bowtech.board.dao.ComentDao;
import com.bowtech.board.model.ComentDto;
@Service
public class ComentService implements IComentService {
	@Autowired
	private ComentDao comentDao;
	
	@Override
	public List<ComentDto> comentList(ComentDto coment) {
		return comentDao.comentList(coment);
	}

	@Override
	public ComentDto comentDetail(ComentDto coment) {
		return comentDao.comentDetail(coment);
	}

	@Override
	public int comentWrite(ComentDto coment) {
		return comentDao.comentWrite(coment);
	}

	@Override
	public int comentDelete(ComentDto coment) {
		return comentDao.comentDelete(coment);
	}

}
