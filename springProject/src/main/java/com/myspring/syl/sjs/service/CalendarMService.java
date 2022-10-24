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








@Service
public class CalendarMService {
	
	@Autowired
	CalendarMDAO calendarMDAO;
	
	public List<CalendarMDTO> selectGoal() {
	
		return calendarMDAO.selectGoal();
	}
	public int insertGoal(String goalSetParam) {
		
		int result = calendarMDAO.insertGoal(goalSetParam);
		return result; 
	}
	
//	public List<CalendarMDTO> selectTodo() {
//		
//		return calendarMDAO.selectTodo();
//	}
//	public int insertTodo(String todoTxtParam) {
//		
//		int result = calendarMDAO.insertTodo(todoTxtParam);
//		return result; 
//	}
	
	public List<CalendarMDTO> selectCalendarM() {
		
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
		
		System.out.println("getCalendarM_time method, calendarM_time : " + calendarM_time);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM일 dd일");

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
	





}



