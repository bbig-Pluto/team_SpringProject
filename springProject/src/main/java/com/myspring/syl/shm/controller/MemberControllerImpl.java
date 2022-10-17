package com.myspring.syl.shm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value = "/member/login",
					method = {RequestMethod.GET, RequestMethod.POST})
	public String firstContact(Model model) {
		return "/shm/signin";
	}
	
	@RequestMapping(value = "/member/memberslist.do",
					method = RequestMethod.GET)
	public ModelAndView listMembers() {
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> membersList = memberService.getMemberList();
		mav.addObject("memList", membersList);
		mav.setViewName("/shm/adminpage");
		
		return mav;
	}
	
	@RequestMapping(value = "/member/login.do",
					method = RequestMethod.POST)
	public String loginCheck(
			HttpServletRequest request,
			HttpSession logOnSession,
			Model model,
			@RequestParam("signin_id") String signin_id,
			@RequestParam("signin_pwd") String signin_pwd) {
		
		MemberDTO memberDTO 
					= memberService.getLoginResult(signin_id, signin_pwd);
		
		logOnSession = request.getSession();
		
		String logOnWhetherForSession = "guest";
		logOnSession.setAttribute("isLogon", logOnWhetherForSession);
		logOnSession.setAttribute("logOn.id", null);
		logOnSession.setAttribute("logOn.memberNum", null);
		logOnSession.setAttribute("logOn.memberClass", null);
		
		// 관리자 로그인
		if(memberDTO.getLoginWhether() == 1) {
			System.out.println("admin login, id : " + memberDTO.getId());
			System.out.println("admin login, memberNum : " + memberDTO.getMemberNum());
			logOnWhetherForSession = "member";
			logOnSession.setAttribute("isLogon", logOnWhetherForSession);
			logOnSession.setAttribute("logOn.id", memberDTO.getId());
			logOnSession.setAttribute("logOn.memberNum", memberDTO.getMemberNum());
			logOnSession.setAttribute("logOn.memberClass", memberDTO.getMemberClass());
			listMembers();
		// 일반회원 로그인
		} else if (memberDTO.getLoginWhether() == 0) {
			System.out.println("Nomal member login, id : " + memberDTO.getId());
			logOnWhetherForSession = "member";
			logOnSession.setAttribute("isLogon", logOnWhetherForSession);
			logOnSession.setAttribute("logOn.id", memberDTO.getId());
			logOnSession.setAttribute("logOn.memberNum", memberDTO.getMemberNum());
			logOnSession.setAttribute("logOn.memberClass", memberDTO.getMemberClass());
			return "/sjs/calendarM";
		// 로그인 실패
		} else if (memberDTO.getLoginWhether() == -1) {
			System.out.println("login fail");
			logOnSession.setAttribute("isLogon", logOnWhetherForSession);
			logOnSession.setAttribute("logOn.id", null);
			logOnSession.setAttribute("logOn.memberNum", null);
			logOnSession.setAttribute("logOn.memberClass", null);
			return "/shm/loginfail";
		} else {
			System.out.println("login fail else route");
			logOnSession.setAttribute("isLogon", logOnWhetherForSession);
			logOnSession.setAttribute("logOn.id", null);
			logOnSession.setAttribute("logOn.memberNum", null);
			logOnSession.setAttribute("logOn.memberClass", null);
			return "/shm/loginfail";
		}
		
		return "/shm/adminpage";
		
	}

}
