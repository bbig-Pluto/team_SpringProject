package com.myspring.syl.shm.controller;

import java.util.List;

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
public class LoginController {
	
	@Autowired
	MemberService memberService;
	
	/**
	 * 로그인 실행, 회원 유무 검증 성공 -> member 부여 실패 -> guest 부여
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
		
		
		String signin_id = dto.getId();
		String signin_pwd = dto.getPwd();
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.getLoginResult(signin_id, signin_pwd);
		
		String logOnWhetherForSession = "";
		String resultMessage = "";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		// 로그인 성공(필요에 따라 memberDTO.getLoginWhether() 를 기준으로 (일반 or 관리자) 회원 로그인 분기 가능)
		if (memberDTO.getLoginWhether() == 0 || memberDTO.getLoginWhether() == 1) {
			logOnWhetherForSession = "member";
			setSuccessSession(logOnSession, memberDTO, logOnWhetherForSession);
			resultMessage = "location.href='/syl/calendarM'";
			
		// 로그인 실패
		} else if (memberDTO.getLoginWhether() == -1) {
			logOnWhetherForSession = "guest";
			setFailSession(logOnSession, memberDTO, logOnWhetherForSession);
			resultMessage += "alert('일치하는 정보의 회원이 없습니다.');";
			resultMessage += " document.querySelector(\"input[name='signin_id']\").focus()";
			
		// 로그인 에러 대응
		} else {
			logOnWhetherForSession = "guest";
			setFailSession(logOnSession, memberDTO, logOnWhetherForSession);
			resultMessage += "alert('알 수 없는 에러가 발생했습니다. \n해당 에러가 계속될 경우 이메일로 문의해주세요.');";
			resultMessage += " document.querySelector(\"input[name='signin_id']\").focus()";
			
		}
		return new ResponseEntity (resultMessage, responseHeaders, HttpStatus.CREATED);

	}

	/**
	 * 슈퍼어드민 전용 로그인
	 * @param request
	 * @param logOnSession
	 * @param model
	 * @param dto
	 * @return ajax
	 */
	@RequestMapping(value = "/member/superAdminlogin.do",
			method = RequestMethod.POST)
	public ResponseEntity superAdminLogin (
			HttpServletRequest request, 
			HttpSession logOnSession, 
			Model model,
			@RequestBody MemberDTO dto) {
		
		logOnSession = request.getSession();
		logOnSession.setMaxInactiveInterval(5*60);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String signin_id = dto.getId();
		String signin_pwd = dto.getPwd();
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.superLogin(signin_id, signin_pwd);
		
		String logOnWhetherForSession = "";
		String resultMessage = "";
		
		// 로그인 성공, 회원정보 페이지로
		if (memberDTO.getLoginWhether() == 0 || memberDTO.getLoginWhether() == 1) {
			logOnWhetherForSession = "member";
			setSuccessSession(logOnSession, memberDTO, logOnWhetherForSession);
			logOnSession.setAttribute("isLogon", "super");
			resultMessage = "location.href='/syl/member/memberslist.do'";
			
		// 로그인 실패
		} else if (memberDTO.getLoginWhether() == -1) {
			logOnWhetherForSession = "guest";
			setFailSession(logOnSession, memberDTO, logOnWhetherForSession);
			resultMessage += "alert('일치하는 정보의 회원이 없습니다.');";
			resultMessage += " document.querySelector(\"input[name='signin_id']\").focus()";
		
		// 로그인 에러 대응
		} else {
			logOnWhetherForSession = "guest";
			setFailSession(logOnSession, memberDTO, logOnWhetherForSession);
			resultMessage += "alert('알 수 없는 에러가 발생했습니다. \n해당 에러가 계속될 경우 이메일로 문의해주세요.');";
			resultMessage += " document.querySelector(\"input[name='signin_id']\").focus()";
		}
		
		return new ResponseEntity (resultMessage, responseHeaders, HttpStatus.CREATED);
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
