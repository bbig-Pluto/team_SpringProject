package com.myspring.syl.sjs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.syl.sjs.dto.CalendarDTO;
import com.myspring.syl.sjs.dto.CalendarMDTO;



@Repository
public class CalendarMDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public List<CalendarMDTO> selectGoal() {
		List<CalendarMDTO> list =sqlSession.selectList("mapper.sjs.goalList");
		
		
		return list;
	}
	public int insertGoal(String goalSet) {
		int result = sqlSession.insert("mapper.sjs.goalValueInsert", goalSet);
		return result; 
		
	
	}
	
	
//	public List<CalendarMDTO> selectTodo() {
//		List<CalendarMDTO> list2 =sqlSession.selectList("mapper.sjs.todoList");
//		
//		
//		return list2;
//	}
//	public int insertTodo(String todoTxt) {
//		int result2 = sqlSession.insert("mapper.sjs.todoValueInsert", todoTxt);
//		return result2; 
//		
//		
//	}
	
	public List<CalendarMDTO> selectCalendarM() {
		List<CalendarMDTO> calendarM_list =sqlSession.selectList("mapper.sjs.calendarM_List");
		
		
		return calendarM_list;
	}
	public int insertCalendarM(CalendarDTO CalendarDTO) {
		
		int calendarM_result = sqlSession.insert("mapper.sjs.calendarValueInsert", CalendarDTO);
		return calendarM_result; 
		
	
	}

}
