package com.bowtech.board.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bowtech.board.dao.FileDao;
import com.bowtech.board.model.FileDto;
@Service
public class FileService implements IFileService {
	@Autowired
	private FileDao fileDao;
	private String savePath = "C:/source/BowtechTest/src/main/webapp/fileUpload/";
	//해당 글의 파일 목록 갖고오기.
	@Override
	public List<FileDto> fileList(FileDto file) {
		return fileDao.fileList(file);
	}
	
	//파일 등록하기.
	@Override
	public int fileUp(MultipartHttpServletRequest request, FileDto file) {
		String uploadPath = request.getRealPath("fileUpload/");
		List<MultipartFile> files = request.getFiles("file");
		String fOriginName = "";
		String fStoreName = "";
		int result =0;		
		for(MultipartFile f :files) {
			fOriginName = f.getOriginalFilename();
			fStoreName = fOriginName;			
			if(fStoreName!=null && !fStoreName.equals("")) {
				if(new File(uploadPath+fStoreName).exists()||new File(savePath+fStoreName).exists()) {
					fStoreName = System.currentTimeMillis()+"_"+fStoreName;
				}
				try {
					f.transferTo(new File(uploadPath+fStoreName));
					result = copy(uploadPath+fStoreName, savePath+fStoreName);
					file.setfSize((int)f.getSize());
					file.setfOrigin_Name(fOriginName);
					file.setfStore_Name(fStoreName);
					fileDao.fileUp(file);
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
		return result;
	}
	
	//파일 삭제처리 하기.
	@Override
	public int fileDelete(FileDto file) {
		return fileDao.fileDelete(file);
	}

	//파일 삭제처리 취소하기.
	@Override
	public int fileDeleteCancle(FileDto file) {
		return fileDao.fileDeleteCancle(file);
	}
	//파일카피(메소드 하나 만들어놓으면 원글쓰기,수정,답변글 까지 이용가능)
		private int copy(String originalFile, String targetFile) {
			int isCopy = 0;
			FileInputStream is = null;
			FileOutputStream os = null;
			try {
				is = new FileInputStream(originalFile);
				os = new FileOutputStream(targetFile);
				byte[] buff = new byte[1024*1024];
				int nRead;
				while((nRead = is.read(buff))!=-1) {
					os.write(buff, 0, nRead);
				}
				isCopy = 1;
			} catch (FileNotFoundException e) {
				System.out.println(e.getMessage());
			} catch (IOException e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if(is!=null) is.close();
					if(os!=null) os.close();
				} catch (Exception e2) {
					System.out.println(e2.getMessage());
				}
			}
			return isCopy;
		}

		@Override
		public FileDto fileDetail(FileDto file) {
			return fileDao.fileDetail(file);
		}

		@Override
		public int fileModify(MultipartHttpServletRequest request, FileDto file) {
			String uploadPath = request.getRealPath("fileUpload/");
			List<MultipartFile> files = request.getFiles("file");
			String fOriginName = "";
			String fStoreName = "";
			int result =0;
			for(MultipartFile f :files) {
				fOriginName = f.getOriginalFilename();
				fStoreName = fOriginName;			
				if(fStoreName!=null && !fStoreName.equals("")) {
					if(new File(uploadPath+fStoreName).exists()||new File(savePath+fStoreName).exists()) {
						fStoreName = System.currentTimeMillis()+"_"+fStoreName;
					}
					try {
						f.transferTo(new File(uploadPath+fStoreName));
						result = copy(uploadPath+fStoreName, savePath+fStoreName);
						file.setfSize((int)f.getSize());
						file.setfOrigin_Name(fOriginName);
						file.setfStore_Name(fStoreName);
						fileDao.fileModify(file);
					}catch(Exception e) {
						System.out.println(e.getMessage());
					}
				}
			}
			return result;			
		}
}
