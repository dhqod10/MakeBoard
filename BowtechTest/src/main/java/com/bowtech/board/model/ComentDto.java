package com.bowtech.board.model;

public class ComentDto {
	private int cNum;
	private String cName;
	private String cContent;
	private String cPw;
	private int bNum;
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getcPw() {
		return cPw;
	}
	public void setcPw(String cPw) {
		this.cPw = cPw;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	@Override
	public String toString() {
		return "ComentDto [cNum=" + cNum + ", cName=" + cName + ", cContent=" + cContent + ", cPw=" + cPw + ", bNum="
				+ bNum + "]";
	}
}
