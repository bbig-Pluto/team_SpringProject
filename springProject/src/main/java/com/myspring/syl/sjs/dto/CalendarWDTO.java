package com.myspring.syl.sjs.dto;

import java.util.Date;

public class CalendarWDTO {
	
	private String calendarM_yyyyDD;
	private int todo_Num;
	private String todo_txt;
	private Date sdfDate3;

	

	
	public int getTodo_Num() {
		return todo_Num;
	}
	
	public void setTodo_Num(int todo_Num) {
		this.todo_Num = todo_Num;
	}
	
	public String getTodo_txt() {
		return todo_txt;
	}
	
	public void setTodo_txt(String todo_txt) {
		this.todo_txt = todo_txt;
	}

	public String getCalendarM_yyyyDD() {
		return calendarM_yyyyDD;
	}

	public void setCalendarM_yyyyDD(String calendarM_yyyyDD) {
		this.calendarM_yyyyDD = calendarM_yyyyDD;
	}

	public Date getSdfDate3() {
		return sdfDate3;
	}

	public void setSdfDate3(Date sdfDate3) {
		this.sdfDate3 = sdfDate3;
	}
	
	
}
