package com.myspring.syl.sjs.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.syl.sjs.dto.CalendarDTO;
import com.myspring.syl.sjs.dto.CalendarMDTO;
import com.myspring.syl.sjs.dto.CalendarWDTO;
import com.myspring.syl.sjs.service.CalendarMService;





@Controller
public class CalendarMController {

	@Autowired
	CalendarMService calendarMService;
	
	
	@RequestMapping(value="/calendarM",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listMain() {
		ModelAndView mav = 	new ModelAndView();
		
		List<CalendarMDTO> list = calendarMService.selectGoal();
		List<CalendarDTO> calendarM_list = calendarMService.selectCalendarM();
		List<CalendarWDTO> list2 = calendarMService.selectTodo();

		
		mav.addObject("goalList",list);
		mav.addObject("calendarM_List",calendarM_list);
		mav.addObject("todoList", list2);
		
		mav.setViewName("/sjs/calendarM");
		
		return mav;
	}
	
	@RequestMapping(value="/calendarMA",method= {RequestMethod.GET,RequestMethod.POST})
	
	public ModelAndView listGoalInsert(
			@ModelAttribute CalendarMDTO CalendarMDTO,
			@RequestParam("calendarM_yyyyDD") String calendarM_yyyyDD, 
			@RequestParam("goal_set") String goal_set) {
		
		int result = calendarMService.insertGoal(CalendarMDTO);
		ModelAndView mav3 = new ModelAndView("redirect:/calendarM");
		return mav3;
	}
	
	@RequestMapping(value="/calendarMA_todo",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listTodoInsert(
			@ModelAttribute CalendarWDTO CalendarWDTO,
			@RequestParam("calendarM_yyyyDD") String calendarM_yyyyDD, 
			@RequestParam("todo_txt") String todo_txt) {
	
		int result2 = calendarMService.insertTodo(CalendarWDTO);
		ModelAndView mav = 	new ModelAndView("redirect:/calendarM");
		return mav;
	

	}
	@RequestMapping(value="/calendarMA_date",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listCalendarMInsert(
			@ModelAttribute CalendarDTO CalendarDTO,
			@RequestParam("calendarM_time") String calendarM_time, 
			@RequestParam("calendarM_Title") String calendarM_Title, 
			@RequestParam("calendarM_Txt") String calendarM_Txt

	){
		
		ModelAndView mav = 	new ModelAndView();
		
		
		int resultCalendarM = calendarMService.insertCalendarM(CalendarDTO);
		
		ModelAndView mav2 = new ModelAndView("redirect:/calendarM");
		return mav2;
	}
	
	

	
	
}
