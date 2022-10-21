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
	
	@RequestMapping(value = "/ajaxconn/signup.do",
					method = RequestMethod.POST)
	public ResponseEntity addMember(
			Model model,
			@RequestBody MemberDTO dto) {
		System.out.println("/ajaxconn/signup.do 진입");
		System.out.println("/ajaxconn/signup.do, dto.getId() : " + dto.getId());
		System.out.println("/ajaxconn/signup.do, dto.getPwd() : " + dto.getPwd());
		System.out.println("/ajaxconn/signup.do, dto.getNickName() : " + dto.getNickName());
		System.out.println("/ajaxconn/signup.do, dto.getEmailAdd() : " + dto.getEmailAdd());
		System.out.println("/ajaxconn/signup.do, dto.getTelNum() : " + dto.getTelNum());
		System.out.println("/ajaxconn/signup.do, dto.getMemberClass() : " + dto.getMemberClass());
		
		Map<String, Object> getParamSignUp = new HashMap<String, Object>();

		getParamSignUp.put("id", dto.getId());
		getParamSignUp.put("pwd", dto.getPwd());
		getParamSignUp.put("nickName", dto.getNickName());
		getParamSignUp.put("emailAdd", dto.getEmailAdd());
		getParamSignUp.put("telNum", dto.getTelNum());
		getParamSignUp.put("memberClass", dto.getMemberClass());
		
		int addMemberWhether = memberService.addMemberSvc(getParamSignUp);
		
		System.out.println("result of addMember : " + addMemberWhether);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		// 회원가입 성공
		if (addMemberWhether == 1) {
			System.out.println("회원가입 성공 route");
			
			String successMessage = "";
			successMessage += "<script>";		
			successMessage += " alert('회원가입 성공');";
			successMessage += " location.href='/syl/member/login';";
			successMessage += "</script>";
			
			return new ResponseEntity (successMessage, responseHeaders, HttpStatus.CREATED);
		// 회원가입 실패(특히 중복 ID)
		} else {
			System.out.println("회원가입 실패 route");
			
			String failMessage = ""; 
			failMessage += "<script>";		
			failMessage += " alert('중복되는 회원 ID가 존재합니다');";
//			failMessage += " location.href='/syl/member/login';";
			failMessage += " document.querySelector('input[name=\"id\"]').focus();";
			failMessage += "</script>";
			return new ResponseEntity (failMessage, responseHeaders, HttpStatus.CREATED);
		}
		
		// if문으로 ajax의 reponse 를 insert 의 반환값에 따라 분기
		// insert 성공(=1) 은 회원가입 성공 alert, 로그인 페이지 이동
		// insert 실패(=0) 는 중복 ID 회원 존재 alert, 회원가입 페이지 유지
		
	}
	
}
