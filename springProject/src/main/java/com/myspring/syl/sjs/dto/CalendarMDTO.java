package com.myspring.syl.sjs.dto;

import java.util.Date;

public class CalendarMDTO {
	
	private String calendarM_yyyyDD;
	private int goal_Num;
	private String goal_set;
	private Date sdfDate2;
	
	public int getGoal_Num() {
		return goal_Num;
	}

	public void setGoal_Num(int goal_Num) {
		this.goal_Num = goal_Num;
	}

	public String getGoal_set() {
		return goal_set;
	}

	public void setGoal_set(String goal_set) {
		this.goal_set = goal_set;
	}

	public String getCalendarM_yyyyDD() {
		return calendarM_yyyyDD;
	}

	public void setCalendarM_yyyyDD(String calendarM_yyyyDD) {
		this.calendarM_yyyyDD = calendarM_yyyyDD;
	}

	public Date getSdfDate2() {
		return sdfDate2;
	}

	public void setSdfDate2(Date sdfDate2) {
		this.sdfDate2 = sdfDate2;
	}


}
