package com.myspring.syl.shm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.syl.shm.dto.MemberDTO;
import com.myspring.syl.shm.service.MemberService;

@Controller
@RequestMapping
public class MemberControllerImpl {

	@Autowired
	MemberService memberService;

	/**
	 * 로그인 페이지 이동
	 * 
	 * @param model
	 * @return String signin.jsp
	 */
	@RequestMapping(value = "/member/login", 
					method = { RequestMethod.GET, RequestMethod.POST })
	public String firstContact() {
		System.out.println("firstContact method");
		return "/shm/signin";
	}

	/**
	 * 단순 페이지 이동 redirect 유도 
	 * 
	 * '/member/rd/{uri} -> /shm/*.jsp page'
	 * @param uri
	 * @param model
	 * @return String viewName
	 */
	@RequestMapping(value = "/member/rd/{uri}", 
					method = {RequestMethod.GET, RequestMethod.POST})
	public String leadingJSP(
			@PathVariable("uri") String uri, Model model) {

		if ("adminpage".equals(uri)) {
			return "/shm/wrongapproach";
		}

		System.out.println("leadingJSP");
		return "/shm/" + uri;
	}
	
	/**
	 * 로그아웃, 동시에 세션 폐기
	 * 
	 * @param model
	 * @param request
	 * @param logOnSession
	 * @return viewName
	 */
	@RequestMapping(value = "/member/logout.do", 
					method = {RequestMethod.POST, RequestMethod.GET})
	public String logout(
			Model model, 
			HttpServletRequest request, 
			HttpSession logOnSession) {
		logOnSession = request.getSession();
		logOnSession.invalidate();

		return "redirect:/member/login"; // 임시
//		return "/sjs/calendarM";
	}

	@RequestMapping(value = "/member/idFoundBinder", 
					method = RequestMethod.GET)
			public String idFoundPage(
					Model model,
					@RequestParam String id) {
				model.addAttribute("foundId", id);
			return "forward:/member/rd/idfound";
		}


}
