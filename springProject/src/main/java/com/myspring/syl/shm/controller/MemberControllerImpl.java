package com.myspring.syl.shm.controller;

import java.util.List;

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

	// 로그인 페이지(jsp) 이동
	@RequestMapping(value = "/member/login", 
					method = { RequestMethod.GET, RequestMethod.POST })
	public String firstContact(Model model) {
		return "/shm/signin";
	}
	
	// 단순 페이지 이동
	@RequestMapping(value = "/member/rd/{uri}", 
					method = RequestMethod.GET)
	public String leadingJSP(
			@PathVariable("uri") String uri,
			Model model) {
		
		if ("adminpage".equals(uri)) {
			return "/shm/wrongapproach";
		}
		
		System.out.println("leadingJSP");
		return "/shm/" + uri;
	}
	
	

	// 관리자 로그인, 회원 정보 리스트 페이지 이동
	@RequestMapping(value = "/member/memberslist.do", 
					method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		HttpSession logOnSession = request.getSession(false); // 현재 세션이 존재하면 기존 세션 리턴, 기존 세션이 없다면 null 값을 리턴

		try {
		if (logOnSession != null) { // 기존 세션 존재 여부 판별
			// '기존 세션이 존재한다면' 의 route 진입
			Integer memberClass = (Integer) logOnSession.getAttribute("logOn.memberClass");
			if (memberClass >= 1) { // 관리자라면
				List<MemberDTO> membersList = memberService.getMemberList();
				mav.addObject("memList", membersList);
				mav.setViewName("/shm/adminpage");
				return mav;
			} else { // 관리자가 아니라면
				mav.setViewName("/shm/wrongapproach"); // 세션은 존재, 관리자가 아닌 사람의 접근
				return mav;
			}
		} else {
			mav.setViewName("/sjs/calendarM"); // 세션이 없으므로(=첫 방문) 달력 페이지로
			return mav;
		}
		}catch (NullPointerException e) {
			mav.setViewName("/shm/wrongapproach");
			return mav;
		}

	}

	// 로그인 시도, 해당 회원 존재 확인
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
			return "redirect:/member/memberslist.do";
			// 일반회원 로그인
		} else if (memberDTO.getLoginWhether() == 0) {
			setSuccessSession(logOnSession, memberDTO, logOnWhetherForSession);
			return "/sjs/calendarM";
			// 로그인 실패.
		} else if (memberDTO.getLoginWhether() == -1) {
			setFailSession(logOnSession, memberDTO, logOnWhetherForSession);
			return "/shm/loginfail";
		} else {
			setFailSession(logOnSession, memberDTO, logOnWhetherForSession);
			return "/shm/loginfail";
		}

	}

	// 로그아웃, 세션 폐기
	@RequestMapping("/member/logout.do")
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
