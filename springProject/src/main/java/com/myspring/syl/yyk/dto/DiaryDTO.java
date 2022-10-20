package com.myspring.syl.yyk.dto;

import java.sql.Date;

public class DiaryDTO {
	
	String d_title;
	String d_content;
	String d_fileName;
	String d_weather;
	String d_emotion;
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
	public String getD_fileName() {
		return d_fileName;
	}
	public void setD_fileName(String d_fileName) {
		this.d_fileName = d_fileName;
	}
	public String getD_weather() {
		return d_weather;
	}
	public void setD_weather(String d_weather) {
		this.d_weather = d_weather;
	}
	public String getD_emotion() {
		return d_emotion;
	}
	public void setD_emotion(String d_emotion) {
		this.d_emotion = d_emotion;
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
