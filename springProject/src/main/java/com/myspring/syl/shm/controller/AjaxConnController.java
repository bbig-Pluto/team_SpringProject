package com.myspring.syl.shm.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.myspring.syl.shm.dto.MemberDTO;
import com.myspring.syl.shm.service.MemberService;

@RestController
public class AjaxConnController {
	
	@Autowired
	MemberService memberService;
	
	/**
	 * ajax 활용 회원가입 
	 * @param model
	 * @param dto
	 * @return String -> JavaScript - ajax - success(){ eval(data) } 
	 */
	@RequestMapping(value = "/ajaxconn/signup.do",
					method = RequestMethod.POST)
	public ResponseEntity addMember(
			Model model,
			@RequestBody MemberDTO dto) {
		
		Map<String, Object> getParamSignUp = new HashMap<String, Object>();

		getParamSignUp.put("id", dto.getId());
		getParamSignUp.put("pwd", dto.getPwd());
		getParamSignUp.put("nickName", dto.getNickName());
		getParamSignUp.put("emailAdd", dto.getEmailAdd());
		getParamSignUp.put("telNum", dto.getTelNum());
		getParamSignUp.put("memberClass", dto.getMemberClass());
		
		int addMemberWhether = memberService.addMemberSvc(getParamSignUp);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		// 회원가입 성공
		if (addMemberWhether == 1) {
			String successMessage = "";
			successMessage += "alert('회원가입 성공');";
			successMessage += " location.href='/syl/member/login'";
			
			return new ResponseEntity (successMessage, responseHeaders, HttpStatus.CREATED);
			
		// 회원가입 실패(특히 중복 ID)
		} else {
			String failMessage = ""; 
			failMessage += "alert('중복되는 회원 ID가 존재합니다');";
			failMessage += " document.querySelector('input[name=\"id\"]').focus();";
			
			return new ResponseEntity (failMessage, responseHeaders, HttpStatus.CREATED);
		}
		
	}
	
}
