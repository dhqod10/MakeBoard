package com.bowtech.board.model;

import java.sql.Date;

public class BoardDto {
	private int bNum; //게시글 번호.
	private String bPw; //게시글 비밀번호.
	private String bName; //게시글 작성자 이름.
	private String bTitle; //게시글 제목.
	private String bContent; //게시글 내용.
	private int bGroup; //글의 그룹번호.
	private int bStep; //답글 순서 정하는 번호.
	private int bIndent; //들여쓰기 값.
	private int bHit; //조회수.
	private int bStatus; //게시글의 상태값.(삭제 확인)
	private int bParentNum; //답글일 경우 부모글 번호.
	private Date bRdate; //작성일.
	private int bTot; //게시글 총 갯수
	private int parentStatus; //부모글의 상태값.
	private int commentCnt; //해당글 댓글의 총 갯수.
	private int fileCnt; //해당 글의 파일 갯수.
	private String searchValue; //검색어 변수.
	//페이징 필요.
	private int startRow;
	private int endRow;
	
	
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public int getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getbPw() {
		return bPw;
	}
	public void setbPw(String bPw) {
		this.bPw = bPw;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public int getbGroup() {
		return bGroup;
	}
	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}
	public int getbStep() {
		return bStep;
	}
	public void setbStep(int bStep) {
		this.bStep = bStep;
	}
	public int getbIndent() {
		return bIndent;
	}
	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public int getbStatus() {
		return bStatus;
	}
	public void setbStatus(int bStatus) {
		this.bStatus = bStatus;
	}
	public int getbParentNum() {
		return bParentNum;
	}
	public void setbParentNum(int bParentNum) {
		this.bParentNum = bParentNum;
	}
	public Date getbRdate() {
		return bRdate;
	}
	public void setbRdate(Date bRdate) {
		this.bRdate = bRdate;
	}
	public int getbTot() {
		return bTot;
	}
	public void setbTot(int bTot) {
		this.bTot = bTot;
	}
	public int getParentStatus() {
		return parentStatus;
	}
	public void setParentStatus(int parentStatus) {
		this.parentStatus = parentStatus;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	@Override
	public String toString() {
		return "BoardDto [bNum=" + bNum + ", bPw=" + bPw + ", bName=" + bName + ", bTitle=" + bTitle + ", bContent="
				+ bContent + ", bGroup=" + bGroup + ", bStep=" + bStep + ", bIndent=" + bIndent + ", bHit=" + bHit
				+ ", bStatus=" + bStatus + ", bParentNum=" + bParentNum + ", bRdate=" + bRdate + ", bTot=" + bTot
				+ ", parentStatus=" + parentStatus + ", commentCnt=" + commentCnt + ", fileCnt=" + fileCnt
				+ ", searchValue=" + searchValue + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	
}
