package com.myspring.syl.shm.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
public class FinderController {

	@Autowired
	MemberService memberService;

	@Autowired
	MemberDTO pwdRewritingDTO;

	/**
	 * 아이디 찾기
	 * 
	 * @param model
	 * @param idFindEmailAdd
	 * @param idFindTelNum
	 * @return String viewName
	 */
	@RequestMapping(value = "/member/idFind.do", 
					method = RequestMethod.POST)
	public ResponseEntity idSearching(
			Model model, 
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestBody MemberDTO dto
//			@RequestParam(value = "idFindEmailAdd", required = true) String idFindEmailAdd,
//			@RequestParam(value = "idFindTelNum", required = true) String idFindTelNum
	) {

		String idFindEmailAdd = dto.getEmailAdd();
		String idFindTelNum = dto.getTelNum();

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		idFindEmailAdd = idFindEmailAdd.replaceAll(" ", "");
		idFindTelNum = idFindTelNum.replaceAll(" ", "");

		// 공란 입력 방어
		if ((idFindEmailAdd != null && !(idFindEmailAdd.isEmpty()))
				&& (idFindTelNum != null && !(idFindTelNum.isEmpty()))) {

			Map<String, Object> idFindMap = new HashMap<String, Object>();
			idFindMap.put("emailAdd", idFindEmailAdd);
			idFindMap.put("telNum", idFindTelNum);

			String foundId = memberService.idFinder(idFindMap);

			if (!(foundId.equals("0"))) {
				
				return new ResponseEntity("location.href='/syl/member/idFoundBinder?id="+ foundId +"'", responseHeaders,HttpStatus.CREATED);
			} else {
				// 조회결과 없음
				String failRes = "";
				failRes += "alert('일치하는 정보의 회원이 없습니다.');";
				failRes += " document.querySelector(\"input[name='idFindEmailAdd']\").focus()";

				return new ResponseEntity(failRes, responseHeaders, HttpStatus.CREATED);
			}
		} else {
			// 입력칸이 공란, 나중에 자바스크립트로도 막기
			String failRes = "";
			failRes += "alert('일치하는 정보의 회원이 없습니다.');";
			failRes += " document.querySelector(\"input[name='idFindEmailAdd']\").focus()";

			return new ResponseEntity(failRes, responseHeaders, HttpStatus.CREATED);
		}
	}
	

	/**
	 * 비밀번호 찾기 에서 사용자 계정 존재 확인
	 * 
	 * @param model
	 * @param dto
	 * @return
	 */
	@RequestMapping(value = "/member/pwdRewriteCheck.do", method = RequestMethod.POST)
	public ResponseEntity pwdRewriteCheck(Model model, @RequestBody MemberDTO dto) {

		String pwdRewriteId = dto.getId();
		String pwdRewriteTelNum = dto.getTelNum();

		pwdRewriteId = pwdRewriteId.replaceAll(" ", "");
		pwdRewriteTelNum = pwdRewriteTelNum.replaceAll(" ", "");

		Map<String, Object> pwdRewritingParam = new HashMap<String, Object>();
		pwdRewritingParam.put("id", pwdRewriteId);
		pwdRewritingParam.put("telNum", pwdRewriteTelNum);

		String enquiryResult = memberService.getEnquiryPwdRewriting(pwdRewritingParam);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		if (!(enquiryResult.equals("0"))) {
			pwdRewritingDTO.setMemberNum(enquiryResult);

			return new ResponseEntity("location.href='/syl/member/rd/pwdrewriting'", responseHeaders,HttpStatus.CREATED);
		} else {
			String failRes = "";
			failRes += "alert('일치하는 정보의 회원이 없습니다.');";
			failRes += " document.querySelector(\"input[name='pwdRewriteId']\").focus()";

			return new ResponseEntity(failRes, responseHeaders, HttpStatus.CREATED);
		}

	}

	/**
	 * 사용자가 입력만 새로운 비밀번호 반영(update)
	 * 
	 * @param model
	 * @param response
	 * @param newPwd
	 * @throws IOException
	 */
	@RequestMapping(value = "/member/pwdRewriting.do", method = RequestMethod.POST)
	public void pwdRewriting(Model model, HttpServletResponse response,
			@RequestParam(value = "newPwd", required = true) String newPwd) throws IOException {

		try {
			// pwdRewriteCheck.do 에서 DTO에 저장한 memberNum 을 활용
			if ((pwdRewritingDTO.getMemberNum()) != null) {
				Map<String, Object> pwdRewringParams = new HashMap();
				pwdRewringParams.put("memberNum", (String) pwdRewritingDTO.getMemberNum());
				pwdRewringParams.put("newPwd", newPwd);

				int resultPwdRewriting = memberService.exePwdRewriting(pwdRewringParams);

				if (resultPwdRewriting == 1) {
					response.sendRedirect("/syl/member/rd/pwdrewritingsuccess");
				} else {
					response.sendRedirect("/syl/member/rd/pwdrewritingfail");
				}
			} else {
				// 주소로 직접 접근 차단
				response.sendRedirect("/syl/member/rd/wrongapproach");
			}
			// pwdRewritingDTO = null 일 때의 제출 차단
		} catch (NullPointerException e) {
			response.sendRedirect("/syl/member/rd/wrongapproach");
		} finally {
			pwdRewritingDTO.setMemberNum(null); // 비밀번호 변경후 memberNum 의 임시저장소 역할을 하던 DTO 초기화
		}
	}

}
