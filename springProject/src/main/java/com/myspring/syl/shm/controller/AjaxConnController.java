package com.myspring.syl.shm.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

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
	public ResponseEntity addMember (
			Model model,
			@RequestBody MemberDTO dto) {
		
		Map<String, Object> getParamSignUp = new HashMap<String, Object>();

		getParamSignUp.put("id", dto.getId());
		getParamSignUp.put("pwd", dto.getPwd());
		getParamSignUp.put("nickName", dto.getNickName());
		getParamSignUp.put("emailAdd", dto.getEmailAdd());
		getParamSignUp.put("telNum", dto.getTelNum());
		
		String rn_ForAdminAdd = dto.getRn_ForAdminAdd();
		
		// 관리자 선택, 0 입력하고 가입하는 Case 방어
		if(rn_ForAdminAdd.equals("0")) {
			dto.setMemberClass(1);
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String resultMessage = ""; 
		
		// 관리자 회원가입
		if ( !(rn_ForAdminAdd == null || rn_ForAdminAdd.equals("")) ) {
			// DB 의 superAdmin 에 등록되어있는 난수와 일치 비교 후 permittingMemberClass 값을 반환해오는 메소드 필요
			int permittingMemberClass = memberService.getPermittingMemberClass(rn_ForAdminAdd);
			System.out.println("permittingMemberClass : " + permittingMemberClass);
			getParamSignUp.put("memberClass", permittingMemberClass);
			
			if(permittingMemberClass != 0) {
				int addMemberWhether = memberService.addMemberSvc(getParamSignUp);
				
				// 회원가입 성공
				if (addMemberWhether == 1) {
					resultMessage += "alert('회원가입 성공!');";
					resultMessage += " location.href='/syl/member/login'";
					
				// 회원가입 실패(특히 중복 ID)
				} else {
					resultMessage += "alert('중복되는 회원 ID가 존재합니다');";
					resultMessage += " document.querySelector('input[name=\"id\"]').focus();";
				}
							
			} else {
				resultMessage += "alert('관리자 인증코드 일치하지 않습니다.');";
				resultMessage += " document.querySelector('input[name=\"rn_ForAdminAdd\"]').focus();";
			}
			
		// 일반 회원가입
		} else if (dto.getMemberClass() == 0) {
			System.out.println("dto.getMemberClass() : " + dto.getMemberClass());
			getParamSignUp.put("memberClass", dto.getMemberClass());
			int addMemberWhether = memberService.addMemberSvc(getParamSignUp);
			
			// 회원가입 성공
			if (addMemberWhether == 1) {
				resultMessage += "alert('회원가입 성공!');";
				resultMessage += " location.href='/syl/member/login'";
				
			// 회원가입 실패(특히 중복 ID)
			} else {
				resultMessage += "alert('중복되는 회원 ID가 존재합니다');";
				resultMessage += " document.querySelector('input[name=\"id\"]').focus();";
			}
			
		} else {
			resultMessage += "alert('부적절한 접근');";
			resultMessage += " document.querySelector('input[name=\"rn_ForAdminAdd\"]').focus();";
		}
		
		return new ResponseEntity (resultMessage, responseHeaders, HttpStatus.CREATED);
	}
	
	
	@RequestMapping(value = "/ajaxconn/rn_generating",
			method = RequestMethod.POST)
	public ResponseEntity rn_generating (
			@RequestBody HashMap setAdminClass) {
		
		// 슈퍼어드민이 설정한 adminClass 자바 변수에 저장
		int adminClass = Integer.parseInt( (String)setAdminClass.get("setAdminClass"));
		
		String generated_code = memberService.setAdminClassGetSignUpCode(adminClass);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String response = "document.querySelector(\"#generated_rn\").value = " + generated_code + ";";
		
		return new ResponseEntity (response, responseHeaders, HttpStatus.CREATED);
	}
}
