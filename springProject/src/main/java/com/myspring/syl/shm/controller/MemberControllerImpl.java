package com.myspring.syl.shm.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.syl.shm.dto.MemberDTO;
import com.myspring.syl.shm.service.MemberService;


@Controller
public class MemberControllerImpl {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/memberslist.do",
					method = RequestMethod.GET)
	public ModelAndView listMembers() {
		ModelAndView mav = new ModelAndView();
		System.out.println("git test 2 accounts");
		TestClass test = new TestClass();
		test.sysoutTest();
		List<MemberDTO> membersList = memberService.getMemberList();
		mav.addObject("memList", membersList);
		mav.setViewName("/shm/adminpage");
		
		return mav;
	}

}
