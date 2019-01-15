package com.bowtech.board.dao;

import java.util.List;

import com.bowtech.board.model.FileDto;

public interface IFileDao {
	public List<FileDto> fileList(FileDto file); //해당 글의 파일 목록 갖고오기
	public int fileUp(FileDto file); //파일 등록하기.
	public int fileDelete(FileDto file); //파일 삭제등록하기.
	public int fileDeleteCancle(FileDto file); //파일 삭제등록 취소하기.
	public FileDto fileDetail(FileDto file); //파일 상세보기.
	public int fileModify(FileDto file); //파일 수정하기.(파일 등록하는 것과 bNum을 받는 방식이 다르다.)
}
