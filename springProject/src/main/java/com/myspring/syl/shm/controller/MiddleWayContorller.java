package com.myspring.syl.shm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.syl.shm.service.MemberService;

@Controller
@RequestMapping
public class MiddleWayContorller {
	
	@Autowired
	MemberService memberService;
	
	/**
	 * 로그인 페이지 이동
	 * @return 로그인 페이지
	 */
	@RequestMapping(value = "/member/login", 
					method = { RequestMethod.GET, RequestMethod.POST})
	public String firstContact () {
		return "/shm/signin";
	}
	
	/**
	 * 단순 페이지 이동 redirect 유도
	 * @param uri
	 * @param model
	 * @return viewName
	 */
	@RequestMapping(value = "/member/rd/{uri}", 
					method = { RequestMethod.GET, RequestMethod.POST })
	public String leadingJSP (
			@PathVariable("uri") String uri,
			Model model) {
		System.out.println("/member/rd/{uri} : " + uri);
		return "/shm/" + uri;
	}
	
	/**
	 * 로그아웃 동시에 세션 폐기
	 * @param model
	 * @param request
	 * @param logOnSession
	 * @return 로그인 페이지
	 */
	@RequestMapping(value = "/member/logout.do", 
					method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(
			Model model,
			HttpServletRequest request,
			HttpSession logOnSession) {
		logOnSession = request.getSession();
		logOnSession.invalidate();
		
		return "redirect:/member/login";
	}
	
	/**
	 * ID 찾기 성공한 ajax reponse 받아오기
	 * @param model
	 * @param id
	 * @return String (ajax ID)
	 */
	@RequestMapping(value = "/member/idFoundBinder", 
					method = RequestMethod.GET)
	public String idFoundPage(
			Model model,
			@RequestParam String id) {
		model.addAttribute("foundId", id);
		return "forward:/member/rd/idfound";
	}
	
}