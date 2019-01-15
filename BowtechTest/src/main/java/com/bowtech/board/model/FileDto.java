package com.bowtech.board.model;

import java.sql.Date;

public class FileDto {
	private int fNum;
	private int bNum;
	private String fOrigin_Name;
	private String fStore_Name;
	private int fSize;
	private int fStatus;
	private Date fRdate;
	public int getfNum() {
		return fNum;
	}
	public void setfNum(int fNum) {
		this.fNum = fNum;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getfOrigin_Name() {
		return fOrigin_Name;
	}
	public void setfOrigin_Name(String fOrigin_Name) {
		this.fOrigin_Name = fOrigin_Name;
	}
	public String getfStore_Name() {
		return fStore_Name;
	}
	public void setfStore_Name(String fStore_Name) {
		this.fStore_Name = fStore_Name;
	}
	public int getfSize() {
		return fSize;
	}
	public void setfSize(int fSize) {
		this.fSize = fSize;
	}
	public int getfStatus() {
		return fStatus;
	}
	public void setfStatus(int fStatus) {
		this.fStatus = fStatus;
	}
	public Date getfRdate() {
		return fRdate;
	}
	public void setfRdate(Date fRdate) {
		this.fRdate = fRdate;
	}
	@Override
	public String toString() {
		return "FileDto [fNum=" + fNum + ", bNum=" + bNum + ", fOrigin_Name=" + fOrigin_Name + ", fStore_Name="
				+ fStore_Name + ", fSize=" + fSize + ", fStatus=" + fStatus + ", fRdate=" + fRdate + "]";
	}
	
	
}
