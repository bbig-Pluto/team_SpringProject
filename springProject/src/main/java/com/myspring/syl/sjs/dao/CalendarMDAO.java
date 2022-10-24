package com.myspring.syl.sjs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.syl.sjs.dto.CalendarDTO;
import com.myspring.syl.sjs.dto.CalendarMDTO;
import com.myspring.syl.sjs.dto.CalendarWDTO;



@Repository
public class CalendarMDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public List<CalendarMDTO> selectGoal() {
		List<CalendarMDTO> list =sqlSession.selectList("mapper.sjs.goalList");
		
		
		return list;
	}
	public int insertGoal(CalendarMDTO CalendarMDTO) {
		int result = sqlSession.insert("mapper.sjs.goalValueInsert", CalendarMDTO);
		
		return result; 
		
	
	}
	
	
	
	
	
	public List<CalendarWDTO> selectTodo() {
		List<CalendarWDTO> todoList =sqlSession.selectList("mapper.sjs.todoList");
			
		return todoList;
	}
	public int insertTodo(CalendarWDTO CalendarWDTO) {
		int result2 = sqlSession.insert("mapper.sjs.todoValueInsert", CalendarWDTO);
		return result2; 
		
		
	}
	
	
	
	
	
	public List<CalendarDTO> selectCalendarM() {
		List<CalendarDTO> calendarM_list =sqlSession.selectList("mapper.sjs.calendarM_List");
		
		
		return calendarM_list;
	}
	public int insertCalendarM(CalendarDTO CalendarDTO) {
		
		int calendarM_result = sqlSession.insert("mapper.sjs.calendarValueInsert", CalendarDTO);
		return calendarM_result; 
		
	
	}

}
