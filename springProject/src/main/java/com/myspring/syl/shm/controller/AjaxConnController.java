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

import com.myspring.syl.shm.dao.MemberDAO;
import com.myspring.syl.shm.dto.MemberDTO;
import com.myspring.syl.shm.service.MemberService;

@RestController
public class AjaxConnController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MemberDAO memberDAO;
	
	/**
	 * ajax 활용 회원가입 
	 * @param model
	 * @param dto
	 * @return String -> JavaScript - ajax - success(){ eval(data) } 
	 */
	@RequestMapping(value = "/ajaxconn/signup.do", method = RequestMethod.POST)
	public ResponseEntity addMember(
			Model model, 
			@RequestBody MemberDTO dto) {

		Map<String, Object> getParamSignUp = new HashMap<String, Object>();

		getParamSignUp.put("id", dto.getId());
		getParamSignUp.put("pwd", dto.getPwd());
		getParamSignUp.put("nickName", dto.getNickName());
		getParamSignUp.put("emailAdd", dto.getEmailAdd());
		getParamSignUp.put("telNum", dto.getTelNum());

		String rn_ForAdminSignUp = dto.getRn_ForAdminAdd();

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		String resultMessage = "";

		// 관리자 회원가입
		if ( !(dto.getRn_ForAdminAdd() == null || dto.getRn_ForAdminAdd().equals("")) ) {
			int permittingMemberClass = memberService.getPermittingMemberClass(rn_ForAdminSignUp);
			getParamSignUp.put("memberClass", permittingMemberClass);

			if (permittingMemberClass != 0) {
				int addMemberWhether = memberService.addMemberSvc(getParamSignUp);

				// 회원가입 성공
				if (addMemberWhether == 1) {
					resultMessage += "alert('관리자 등록 성공!');";
					resultMessage += " location.href='/syl/member/login'";
					memberDAO.getSignUpCode(); // 관리자 등록 코드 재활용 방지를 위해 난수 재생성
					
					// 회원가입 실패(특히 중복 ID)
				} else {
					resultMessage += "alert('중복되는 회원 ID가 존재합니다');";
					resultMessage += " document.querySelector('input[name=\"id\"]').focus();";
				}

			} else {
				resultMessage += "alert('관리자 등록 코드가 일치하지 않습니다.');";
				resultMessage += " document.querySelector('input[name=\"rn_ForAdminAdd\"]').focus();";
			}

			// 일반 회원가입
		} else if (dto.getMemberClass() == 0) {
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

		return new ResponseEntity(resultMessage, responseHeaders, HttpStatus.CREATED);

	}
	
	/**
	 * 슈퍼어드민의 가입할 memberClass 세팅 & 관리자 가입 코드 획득
	 * @param setAdminClass
	 * @return ajax
	 */
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
