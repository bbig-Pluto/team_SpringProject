package com.myspring.syl.shm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.syl.shm.dto.MemberDTO;
import com.myspring.syl.shm.service.MemberService;

@Controller
@RequestMapping
public class MyPageController {
	
	@Autowired
	MemberService memberService;
	
	/**
	 * 마이페이지 회원탈퇴
	 * 회원정보 delete & 게시판 제외한 콘텐츠들 일괄 delete
	 * @param request
	 * @param logOnSession
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/deleteAccount.do")
	public String deleteAccountSelf(
			HttpServletRequest request, 
			HttpSession logOnSession, 
			Model model) {
		logOnSession = request.getSession();
		
		String memberNum = "" + logOnSession.getAttribute("logOn.memberNum");
		System.out.println("/signout.do memberNum : " + memberNum);
		
		memberService.exeDeleteAccountSelf(memberNum);
		System.out.println("deleteAccount 실행 종료");
		
		logOnSession.invalidate();
		return "redirect:/member/login";
//		return "/sjs/calendar";
	}
	
	
	/**
	 * 마이페이지에서 수정하고자 할 회원의 데이터 획득, 전시
	 * @param request
	 * @param logOnSession
	 * @param model
	 * @return DTO binding and viewName
	 */
	/*
	@RequestMapping("/member/getMemberInfo.do")
	public String loadMemberInfo(
			HttpServletRequest request, 
			HttpSession logOnSession, 
			Model model) {
		logOnSession = request.getSession();
		String memberNum = "" + logOnSession.getAttribute("logOn.memberNum");
		
		MemberDTO dto = memberService.getMemberInfo(memberNum);
		
		model.addAttribute("memberInfo", dto);
		
		return "forward:/member/rd/mypagemodi";
	}
	*/
	
	/**
	 * 마이페이지 회원정보 계정 본인이 직접 수정
	 * @param request
	 * @param logOnSession
	 * @param model
	 * @param telNum
	 * @param nickName
	 * @param emailAdd
	 * @return
	 */
	@RequestMapping("/member/modifyInfoSelf.do")
	public String modifyInfoSelf(
			HttpServletRequest request, 
			HttpSession logOnSession, 
			Model model,
			@RequestParam("telNum") String telNum,
			@RequestParam("nickName") String nickName,
			@RequestParam("emailAdd") String emailAdd
			) {
		logOnSession = request.getSession();
		String memberNum = "" + logOnSession.getAttribute("logOn.memberNum");
		
		MemberDTO dto = new MemberDTO();
		dto.setTelNum(telNum);
		dto.setNickName(nickName);
		dto.setEmailAdd(emailAdd);
		dto.setMemberNum(memberNum);
		
		int result = memberService.exeModifyInfoSelf(dto);
		
		if(result == 1) {
			return "redirect:/member/rd/mypage";
		} else {
			return "redirect:/member/rd/wrongapproach";
		}
		
	}
}
