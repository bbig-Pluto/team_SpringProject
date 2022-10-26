package com.myspring.syl.sjs.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
//import java.sql.Date;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.syl.sjs.dao.CalendarMDAO;
import com.myspring.syl.sjs.dto.CalendarDTO;
import com.myspring.syl.sjs.dto.CalendarMDTO;
import com.myspring.syl.sjs.dto.CalendarWDTO;








@Service
public class CalendarMService {
	
	@Autowired
	CalendarMDAO calendarMDAO;
	
	public List<CalendarMDTO> selectGoal() {
		
		return calendarMDAO.selectGoal();
	}
	public int insertGoal(CalendarMDTO CalendarMDTO) {
		String date2 = CalendarMDTO.getCalendarM_yyyyDD();
		
		Date dateAfter2 = getCalendarWM_Date(date2);
		
		CalendarMDTO.setSdfDate2(dateAfter2);
		
		int result = calendarMDAO.insertGoal(CalendarMDTO);
		return result; 
	}
	
	public List<CalendarWDTO> selectTodo() {
		
		return calendarMDAO.selectTodo();
	}
	
	public int insertTodo(CalendarWDTO CalendarWDTO) {
		String date3 = CalendarWDTO.getCalendarM_yyyyDD();
		Date dateAfter3 = getCalendarWM_Date(date3);

		CalendarWDTO.setSdfDate3(dateAfter3);
		
		int result = calendarMDAO.insertTodo(CalendarWDTO);
		return result; 
	}
	
	public List<CalendarDTO> selectCalendarM() {
		
		return calendarMDAO.selectCalendarM();
	}
	
	
	public int insertCalendarM(CalendarDTO CalendarDTO) {
		String date = CalendarDTO.getCalendarM_time();
		Date dateAfter = (Date)getCalendarM_time(date);
		CalendarDTO.setSdfDate(dateAfter);
		
		int result = calendarMDAO.insertCalendarM(CalendarDTO);
		
		return result; 
	}
	
	
	
	public List getCalendarM_time(String calendarM_time) {
		
		System.out.println("calendarM_timecalendarM_timecalendarM_timecalendarM_time: " + calendarM_time) ;
		
		String[] total = calendarM_time.split(" ");
		String year = total[0];
		String month = total[1];

		
		String year_js = year.substring(0,year.length()-1);
		String month_js = month.substring(0,month.length()-1);

		
		Map map = new HashMap();
		map.put("year_js",year_js);
		map.put("month_js",month_js);

		
		System.out.println("year___: "+year_js);
		System.out.println("month___: "+month_js);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 ");
		System.out.println("sdfsdfsdfsdfsdfsdfsdfsdfsdfsdf: "+sdf);

		Date to = null;
		try {
			
			
			
			to = (Date) sdf.parse(calendarM_time);
			System.out.println("Date로 변환할 String Data: " + to);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		List list_Ajax = calendarMDAO.selectAjaxCalendarM(map);
		
		System.out.println("calendarMDAO.selectAjaxCalendarM(map)__________list_Ajax: "+list_Ajax);
		
		
		return list_Ajax;
		
	}
	
	public Date getCalendarWM_Date(String calendarM_yyyyDD) {
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 ");
		
		Date to = null;
		try {
			to = (Date) sdf.parse(calendarM_yyyyDD);
			System.out.println("Date로 변환할 String Data: " + to);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		return to;
		
	}
	





}



