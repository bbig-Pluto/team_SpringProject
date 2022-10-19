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
public class AdminController {

	@Autowired
	MemberService memberService;
	
	/**
	 * 관리자 로그인 -> 회원정보 리스트 페이지 로드, 관리자 아닌 케이스의 방어 포함
	 * 
	 * @param request
	 * @return String viewName
	 */
	@RequestMapping(value = "/member/memberslist.do", 
					method = { RequestMethod.GET, RequestMethod.POST })
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
		} catch (NullPointerException e) {
			mav.setViewName("/shm/wrongapproach");
			return mav;
		}
	}

	/**
	 * 관리자 페이지에서 회원 삭제
	 * 
	 * @param model
	 * @param memberNum
	 * @return viewName
	 */
	@RequestMapping(value = "/member/delMemberFromAdmin.do", method = RequestMethod.GET)
	public String delMemFromAdmin(

			Model model, @RequestParam(value = "memberNum", required = true) String memberNum) {
		int delResult = memberService.exeDelMemFromAdmin(memberNum);

		if (delResult == 1) {
			return "redirect:/member/memberslist.do";
		} else {
			return "redirect:/member/rd/wrongapproach";
		}
	}

	/**
	 * 관리자 페이지에서 정보를 수정할 회원 특정, DB에서 수정할 정보 불러오기
	 * 
	 * @return viewName
	 */
	@RequestMapping(value = "/member/enquireMemberFromAdmin.do", method = RequestMethod.GET)
	public String enquireMemberFromAdmin(Model model, @RequestParam("memberNum") String memberNum) {
		MemberDTO dto = memberService.getMemberInfoForModify(memberNum);
		model.addAttribute("memInfo", dto);
		return "/shm/modifymemberform";
	}

	/**
	 * 관리자가 수정한 회원정보 실제 계정에 반영(update)
	 * 
	 * @param model
	 * @param modiNickname
	 * @param modiEmailAdd
	 * @param modiTelNum
	 * @return viewName
	 */
	@RequestMapping(value = "/member/modifyingMemberInfo.do", method = RequestMethod.GET)
	public String modifyingMemberInfo(Model model, @RequestParam("nickName") String modiNickname,
			@RequestParam("emailAdd") String modiEmailAdd, @RequestParam("telNum") String modiTelNum,
			@RequestParam("memberNum") String modiMemberNum) {
		MemberDTO dto = new MemberDTO();
		dto.setNickName(modiNickname);
		dto.setEmailAdd(modiEmailAdd);
		dto.setTelNum(modiTelNum);
		dto.setMemberNum(modiMemberNum);

		int result = memberService.exeModifyMemberInfo(dto);

		if (result == 1) {
			return "redirect:/member/memberslist.do";
		} else {
			return "redierct:/member/rd/wrongapproach";
		}
	}
}
