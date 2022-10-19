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
					method = RequestMethod.GET)
	public String leadingJSP(
			@PathVariable("uri") String uri, Model model) {

		if ("adminpage".equals(uri)) {
			return "/shm/wrongapproach";
		}

		System.out.println("leadingJSP");
		return "/shm/" + uri;
	}

	/**
	 * 회원가입
	 * 
	 * @param model
	 * @param addMemId
	 * @param addMemPwd
	 * @param addMemNickname
	 * @param addMememailAdd
	 * @param addMemtelNum
	 * @param addMemMemberClass
	 * @return String viewName
	 */
	@RequestMapping(value = "/member/signup.do", 
					method = RequestMethod.POST)
	public String addMember(
			Model model, 
			@RequestParam(value = "id", required = true) String addMemId,
			@RequestParam(value = "pwd", required = true) String addMemPwd,
			@RequestParam(value = "nickName", required = true) String addMemNickname,
			@RequestParam(value = "emailAdd", required = true) String addMememailAdd,
			@RequestParam(value = "telNum", required = true) String addMemtelNum,
			@RequestParam(value = "memberClass", required = true) Integer addMemMemberClass) {

		Map<String, Object> getParamSignUp = new HashMap<String, Object>();

		getParamSignUp.put("id", addMemId);
		getParamSignUp.put("pwd", addMemPwd);
		getParamSignUp.put("nickName", addMemNickname);
		getParamSignUp.put("emailAdd", addMememailAdd);
		getParamSignUp.put("telNum", addMemtelNum);
		getParamSignUp.put("memberClass", addMemMemberClass);

		int addMemberWhether = memberService.addMemberSvc(getParamSignUp);

		// map 순회출력
//		for(String key : getParamSignUp.keySet() ) {
//			System.out.println(key + ", " + getParamSignUp.get(key));
//		}

		if (addMemberWhether == 1) {
			// 회원가입 성공
			return "redirect:/member/rd/sucesssignup";
			// 회원가입 실패(특히, 중복 ID)
		} else {
			return "redirect:/member/rd/failsignup";
		}

	}

}
