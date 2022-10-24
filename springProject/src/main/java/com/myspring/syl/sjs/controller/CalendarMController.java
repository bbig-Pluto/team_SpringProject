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
import com.myspring.syl.sjs.service.CalendarMService;





@Controller
public class CalendarMController {

	@Autowired
	CalendarMService calendarMService;
	
	
	@RequestMapping(value="/calendarM",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listMain() {
		ModelAndView mav = 	new ModelAndView();
		
		List<CalendarMDTO> list = calendarMService.selectGoal();
		List<CalendarMDTO> calendarM_list = calendarMService.selectCalendarM();

		
		mav.addObject("goalList",list);
		mav.addObject("calendarM_List",calendarM_list);
		mav.setViewName("/sjs/calendarM");
		
		return mav;
	}
	
	@RequestMapping(value="/calendarMA",method= {RequestMethod.GET,RequestMethod.POST})
	
	public ModelAndView listGoalInsert(@RequestParam("goal_set") String goal_set) {
		ModelAndView mav = 	new ModelAndView();
		
		int result = calendarMService.insertGoal(goal_set);
		List<CalendarMDTO> list = calendarMService.selectGoal();
		mav.addObject("goalList", list);
		mav.setViewName("/sjs/calendarMA");
		return mav;
	}
	
	
	

	
	@RequestMapping(value="/calendarMA_date",method= {RequestMethod.GET,RequestMethod.POST})	
	public ModelAndView listCalendarMInsert(
			@ModelAttribute CalendarDTO CalendarDTO,
			@RequestParam("calendarM_time") String calendarM_time, 
			@RequestParam("calendarM_Title") String calendarM_Title, 
			@RequestParam("calendarM_Txt") String calendarM_Txt

	){
		System.out.println("calendarMA_date Controller, calendarM_time : " + calendarM_time);
		System.out.println("calendarMA_date Controller, calendarM_Title : " + calendarM_Title);
		System.out.println("calendarMA_date Controller, calendarM_Txt : " + calendarM_Txt);
		
		ModelAndView mav = 	new ModelAndView();
		
		System.out.println("mav 출력: "+ mav);
		
		int resultCalendarM = calendarMService.insertCalendarM(CalendarDTO);
		
		System.out.println("date 출력: "+ resultCalendarM);
		
		List<CalendarMDTO> calendarM_list = calendarMService.selectCalendarM();
		mav.addObject("calendarM_List", calendarM_list);
		mav.setViewName("/sjs/calendarMA");
		return mav;
	}
	
	

	
	
}
