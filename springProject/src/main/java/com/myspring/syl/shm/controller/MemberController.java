package com.myspring.syl.shm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MemberController {
	
	public String loginCheck(
			HttpServletRequest request,
			HttpSession logOnSession,
			Model model,
			@RequestParam("signin_id") String signin_id,
			@RequestParam("signin_pwd") String signin_pwd);
	
	public ModelAndView listMembers();
	
}
