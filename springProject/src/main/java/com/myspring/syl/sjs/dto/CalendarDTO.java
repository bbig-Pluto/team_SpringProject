package com.myspring.syl.sjs.dto;

import java.util.Date;

public class CalendarDTO {
	
	private String calendarM_time;
	private String calendarM_Title;
	private String calendarM_Txt;
	private Date sdfDate;
	
	public String getCalendarM_time() {
		return calendarM_time;
	}
	
	public void setCalendarM_time(String calendarM_time) {
		this.calendarM_time = calendarM_time;
	}
	
	public String getCalendarM_Title() {
		return calendarM_Title;
	}

	public void setCalendarM_Title(String calendarM_Title) {
		this.calendarM_Title = calendarM_Title;
	}

	public String getCalendarM_Txt() {
		return calendarM_Txt;
	}

	public void setCalendarM_Txt(String calendarM_Txt) {
		this.calendarM_Txt = calendarM_Txt;
	}

	public Date getSdfDate() {
		return sdfDate;
	}

	public void setSdfDate(Date sdfDate) {
		this.sdfDate = sdfDate;
	}
	
	

}
