package com.myspring.syl.shm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.syl.shm.dto.MemberDTO;
import com.myspring.syl.shm.service.MemberService;

@Controller
@RequestMapping
public class SessionController {
	
	@Autowired
	MemberService memberService;
	
	/**
	 * 로그인 실행, 회원 유무 검증 성공 -> member 부여 실패 -> guest 부여
	 * 
	 * @param request
	 * @param logOnSession
	 * @param model
	 * @param signin_id
	 * @param signin_pwd
	 * @return String viewName
	 */
	@RequestMapping(value = "/member/login.do", 
					method = RequestMethod.POST)
	public String loginCheck(
			HttpServletRequest request, 
			HttpSession logOnSession, 
			Model model,
			@RequestParam("signin_id") String signin_id, 
			@RequestParam("signin_pwd") String signin_pwd) {
		MemberDTO memberDTO = memberService.getLoginResult(signin_id, signin_pwd);

		logOnSession = request.getSession();

		// 최초 세팅은 guest로 강제
		String logOnWhetherForSession = "guest";
		setFailSession(logOnSession, memberDTO, logOnWhetherForSession);

		// 관리자 로그인
		if (memberDTO.getLoginWhether() == 1) {
			setSuccessSession(logOnSession, memberDTO, logOnWhetherForSession);
			return "forward:/member/memberslist.do";
			// 일반회원 로그인
		} else if (memberDTO.getLoginWhether() == 0) {
			setSuccessSession(logOnSession, memberDTO, logOnWhetherForSession);
			return "/sjs/calendarM";
			// 로그인 실패
		} else if (memberDTO.getLoginWhether() == -1) {
			setFailSession(logOnSession, memberDTO, logOnWhetherForSession);
			return "/shm/loginfail";
		} else {
			setFailSession(logOnSession, memberDTO, logOnWhetherForSession);
			return "/shm/loginfail";
		}

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
					method = RequestMethod.GET)
	public String logout(
			Model model, 
			HttpServletRequest request, 
			HttpSession logOnSession) {
		logOnSession = request.getSession();

		logOnSession.invalidate();

		return "redirect:/member/login.do"; // 임시
//		return "/sjs/calendarM";
	}
	
	
	private void setFailSession(HttpSession logOnSession, MemberDTO memberDTO, String logOnWhetherForSession) {
		logOnWhetherForSession = "guest";
		logOnSession.setAttribute("isLogon", logOnWhetherForSession);
		logOnSession.setAttribute("logOn.id", null);
		logOnSession.setAttribute("logOn.memberNum", null);
		logOnSession.setAttribute("logOn.memberClass", null);
	}

	private void setSuccessSession(HttpSession logOnSession, MemberDTO memberDTO, String logOnWhetherForSession) {
		logOnWhetherForSession = "member";
		logOnSession.setAttribute("isLogon", logOnWhetherForSession);
		logOnSession.setAttribute("logOn.id", memberDTO.getId());
		logOnSession.setAttribute("logOn.memberNum", memberDTO.getMemberNum());
		logOnSession.setAttribute("logOn.memberClass", memberDTO.getMemberClass());
	}

	
}
