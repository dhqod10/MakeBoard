package com.bowtech.board.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bowtech.board.model.FileDto;

public interface IFileService {
	public List<FileDto> fileList(FileDto file); //해당 글의 파일 목록 갖고오기
	public int fileUp(MultipartHttpServletRequest request, FileDto file); //파일 등록하기.
	public int fileDelete(FileDto file); //파일 삭제등록하기.
	public int fileDeleteCancle(FileDto file); //파일 삭제등록 취소하기.
	public FileDto fileDetail(FileDto file); //파일 상세보기.
	public int fileModify(MultipartHttpServletRequest request, FileDto file); //파일 수정하기.(파일 등록하는 것과 bNum을 받는 방식이 다르다.)
}
