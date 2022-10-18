package com.myspring.syl.yyk.dto;

import java.sql.Date;

public class DiaryDTO {
	
	String d_title;
	String d_content;
	Date d_createTime;
	int diaryNum;
	String id;
	
	public int getDiaryNum() {
		return diaryNum;
	}
	public void setDiaryNum(int diaryNum) {
		this.diaryNum = diaryNum;
	}
	public String getD_title() {
		return d_title;
	}
	public void setD_title(String d_title) {
		this.d_title = d_title;
	}
	public String getD_content() {
		return d_content;
	}
	public void setD_content(String d_content) {
		this.d_content = d_content;
	}
	public Date getD_createTime() {
		return d_createTime;
	}
	public void setD_createTime(Date d_createTime) {
		this.d_createTime = d_createTime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
