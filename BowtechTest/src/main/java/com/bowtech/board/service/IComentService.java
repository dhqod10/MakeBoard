package com.bowtech.board.service;

import java.util.List;

import com.bowtech.board.model.ComentDto;

public interface IComentService {
	public List<ComentDto> comentList(ComentDto coment); //해당 글의 댓글 리스트 갖고오기.
	public ComentDto comentDetail(ComentDto coment); //댓글 상세정보.
	public int comentWrite(ComentDto coment); //댓글 작성하기.
	public int comentDelete(ComentDto coment); //댓글 삭제하기.
}
