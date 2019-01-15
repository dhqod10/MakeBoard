package com.bowtech.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bowtech.board.model.FileDto;

@Repository
public class FileDao implements IFileDao{
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	//해당 글의 파일 목록 갖고오기.
	@Override
	public List<FileDto> fileList(FileDto file) {
		return sessionTemplate.selectList("fileList",file);
	}
	
	//파일 등록하기.
	@Override
	public int fileUp(FileDto file) {
		return sessionTemplate.insert("fileUp",file);
	}
	
	//파일 삭제처리하기.
	@Override
	public int fileDelete(FileDto file) {
		return sessionTemplate.update("fileDelete",file);
	}
	
	//파일 삭제처리 취소.
	@Override
	public int fileDeleteCancle(FileDto file) {
		return sessionTemplate.update("fileDeleteCancle",file);
	}
	
	//파일 상세보기.
	@Override
	public FileDto fileDetail(FileDto file) {
		return sessionTemplate.selectOne("fileDetail",file);
	}

	@Override
	public int fileModify(FileDto file) {
		return sessionTemplate.insert("fileModify",file);
	}

}
