package com.myspring.syl.sjs.service;


//import java.sql.Date;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

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
		Date dateAfter = getCalendarM_time(date);
		CalendarDTO.setSdfDate(dateAfter);
		
		int result = calendarMDAO.insertCalendarM(CalendarDTO);
		
		return result; 
	}
	
	
	
	public Date getCalendarM_time(String calendarM_time) {
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");

		Date to = null;
		try {
			to = (Date) sdf.parse(calendarM_time);
			System.out.println("Date로 변환할 String Data: " + to);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return to;
		
	}
	
	public Date getCalendarWM_Date(String calendarM_yyyyDD) {
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 ");
		
		Date to = null;
		try {
			to = (Date) sdf.parse(calendarM_yyyyDD);
			System.out.println("Date로 변환할 String Data: " + to);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return to;
		
	}
	





}



