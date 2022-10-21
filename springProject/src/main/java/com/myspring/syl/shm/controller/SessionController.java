package com.myspring.syl.shm.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myspring.syl.shm.dto.MemberDTO;
import com.myspring.syl.shm.service.MemberService;

@RestController
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
	public ResponseEntity loginCheck(
			HttpServletRequest request, 
			HttpSession logOnSession, 
			Model model,
			@RequestBody MemberDTO dto) {
		logOnSession = request.getSession();
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String signin_id = dto.getId();
		String signin_pwd = dto.getPwd();
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.getLoginResult(signin_id, signin_pwd);
		
		logOnSession = request.getSession();
		String logOnWhetherForSession = "";

		// 관리자 로그인
		if (memberDTO.getLoginWhether() == 1) {
			logOnWhetherForSession = "member";
			setSuccessSession(logOnSession, memberDTO, logOnWhetherForSession);
			String successRes = "location.href='/syl/member/memberslist.do'";
			
			return new ResponseEntity (successRes, responseHeaders, HttpStatus.CREATED);
			
		// 일반회원 로그인
		} else if (memberDTO.getLoginWhether() == 0) {
			logOnWhetherForSession = "member";
			setSuccessSession(logOnSession, memberDTO, logOnWhetherForSession);
			String successRes = "location.href='/syl/sjs/calendarM'";
			
			return new ResponseEntity (successRes, responseHeaders, HttpStatus.CREATED);
			
		// 로그인 실패
		} else if (memberDTO.getLoginWhether() == -1) {
			logOnWhetherForSession = "guest";
			setFailSession(logOnSession, memberDTO, logOnWhetherForSession);
			String failRes = ""; 
			failRes += "alert('일치하는 정보의 회원이 없습니다.');";
			failRes += " document.querySelector(\"input[name='signin_id']\").focus()";
			
			return new ResponseEntity (failRes, responseHeaders, HttpStatus.CREATED);
			
		} else {
			logOnWhetherForSession = "guest";
			setFailSession(logOnSession, memberDTO, logOnWhetherForSession);
			String failRes = ""; 
			failRes += "alert('알 수 없는 에러가 발생했습니다. \n해당 에러가 계속될 경우 이메일로 문의해주세요.');";
			failRes += " document.querySelector(\"input[name='signin_id']\").focus()";
			
			return new ResponseEntity (failRes, responseHeaders, HttpStatus.CREATED);
		}

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
