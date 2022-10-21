package com.myspring.syl.shm.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.syl.shm.dto.MemberDTO;
import com.myspring.syl.shm.service.MemberService;

@Controller
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
	public String idSearching(
			Model model, 
			@RequestParam(value = "idFindEmailAdd", required = true) String idFindEmailAdd,
			@RequestParam(value = "idFindTelNum", required = true) String idFindTelNum) {

		idFindEmailAdd = idFindEmailAdd.replaceAll(" ", "");
		idFindTelNum = idFindTelNum.replaceAll(" ", "");

		// 공란 입력 방어
		if ((idFindEmailAdd != null && !(idFindEmailAdd.isEmpty()))
				&& (idFindTelNum != null && !(idFindTelNum.isEmpty()))) {

			Map<String, Object> idFindMap = new HashMap<String, Object>();
			idFindMap.put("emailAdd", idFindEmailAdd);
			idFindMap.put("telNum", idFindTelNum);

			String foundId = memberService.idFinder(idFindMap);

			if ( !(foundId.equals("0")) ) {
				model.addAttribute("foundId", foundId);
				return "/shm/idfound";
			} else {
				// 조회결과 없음
				return "redirect:/member/rd/idfoundfail";
			}
		} else {
			// 입력칸이 공란, 나중에 자바스크립트로도 막기
			return "redirect:/member/rd/idfoundfail";
		}
	}
	
	/**
	 * 비밀번호 찾기 에서 사용자 계정 존재 확인
	 * 
	 * @param model
	 * @param pwdRewriteId
	 * @param pwdRewriteTelNum
	 * @return viewName
	 */
	@RequestMapping(value = "/member/pwdRewriteCheck.do", 
					method = RequestMethod.POST)
	public String pwdRewriteCheck(
			Model model,
			@RequestParam(value = "pwdRewriteId", required = true) String pwdRewriteId,
			@RequestParam(value = "pwdRewriteTelNum", required = true) String pwdRewriteTelNum) {
		
		pwdRewriteId = pwdRewriteId.replaceAll(" ", "");
		pwdRewriteTelNum = pwdRewriteTelNum.replaceAll(" ", "");
		
		Map<String, Object> pwdRewritingParam = new HashMap<String, Object>();
		pwdRewritingParam.put("id", pwdRewriteId);
		pwdRewritingParam.put("telNum", pwdRewriteTelNum);

		// memberNum 을 반환
		String enquiryResult = memberService.getEnquiryPwdRewriting(pwdRewritingParam);

		if ((pwdRewriteId != null && !(pwdRewriteId.isEmpty()))
				&& (pwdRewriteTelNum != null && !(pwdRewriteTelNum.isEmpty()))) {
			
			if (!(enquiryResult.equals("0"))) {
				pwdRewritingDTO.setMemberNum(enquiryResult);
				return "redirect:/member/rd/pwdrewriting";
			} else {
				// 조회결과 없음
				return "redirect:/member/rd/pwdrewritingfail";
			}
		} else {
			// 입력칸이 공란, 나중에 자바스크립트로 막기
			return "redirect:/member/rd/pwdrewritingfail";
		}
	}

	/**
	 * 사용자가 입력만 새로운 비밀번호 반영(update)
	 * 
	 * @param model
	 * @param newPwd
	 * @return viewName
	 */
	@RequestMapping(value = "/member/pwdRewriting.do", 
					method = RequestMethod.POST)
	public String pwdRewriting(
			Model model, 
			@RequestParam(value = "newPwd", required = true) String newPwd) {

		try {
			// pwdRewriteCheck.do 에서 DTO에 저장한 memberNum 을 활용
			if ((pwdRewritingDTO.getMemberNum()) != null) {
				Map<String, Object> pwdRewringParams = new HashMap();
				pwdRewringParams.put("memberNum", (String) pwdRewritingDTO.getMemberNum());
				pwdRewringParams.put("newPwd", newPwd);

				int resultPwdRewriting = memberService.exePwdRewriting(pwdRewringParams);

				if (resultPwdRewriting == 1) {
					return "/shm/pwdrewritingsuccess";
				} else {
					return "/shm/pwdrewritingfail";
				}
			} else {
				// 주소로 직접 접근 차단
				return "/shm/wrongapproach";
			}
			// pwdRewritingDTO = null 일 때의 제출 차단
		} catch (NullPointerException e) {
			return "/shm/wrongapproach";
		} finally {
			pwdRewritingDTO.setMemberNum(null); // 비밀번호 변경후 memberNum 의 임시저장소 역할을 하던 DTO 초기화
		}
	}

	
}
