package com.myspring.syl.sjs.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.syl.shm.dto.MemberDTO;
import com.myspring.syl.sjs.dto.CalendarDTO;
import com.myspring.syl.sjs.dto.CalendarMDTO;
import com.myspring.syl.sjs.dto.CalendarWDTO;
import com.myspring.syl.sjs.service.CalendarMService;





@RestController
public class AjaxCalendarMController {

	@Autowired
	CalendarMService calendarMService;
	
	@RequestMapping(value = "/ajax/test", method = {RequestMethod.GET, RequestMethod.POST})
	public List sendContent(@RequestBody Map map) {
				
				
		
		List list = (List)calendarMService.getCalendarM_time((String)map.get("calendarM_time"));
		
		
		
		return list;
	}
	
	

	
	
}
