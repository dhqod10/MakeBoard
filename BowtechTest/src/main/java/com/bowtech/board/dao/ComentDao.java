package com.bowtech.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bowtech.board.model.ComentDto;
@Repository
public class ComentDao implements IComentDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List<ComentDto> comentList(ComentDto coment) {
		return sessionTemplate.selectList("comentList",coment);
	}

	@Override
	public ComentDto comentDetail(ComentDto coment) {
		return sessionTemplate.selectOne("comentDetail",coment);
	}

	@Override
	public int comentWrite(ComentDto coment) {
		return sessionTemplate.insert("comentWrite",coment);
	}

	@Override
	public int comentDelete(ComentDto coment) {
		return sessionTemplate.delete("comentDelete",coment);
	}

}
