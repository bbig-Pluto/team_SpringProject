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

	@Autowired
	MemberDTO pwdRewritingDTO;

	/**
	 * 로그인 페이지 이동
	 * 
	 * @param model
	 * @return String signin.jsp
	 */
	@RequestMapping(value = "/member/login", 
					method = { RequestMethod.GET, RequestMethod.POST })
	public String firstContact(Model model) {
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
	 * 관리자 로그인 -> 회원정보 리스트 페이지 로드 관리자 아닌 케이스의 방어 포함
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
	 * 로그인 실행, 회원 유무 검증 성공 -> member 부여 실패 -> guest 부여
	 * 
	 * @param request
	 * @param logOnSession
	 * @param model
	 * @param signin_id
	 * @param signin_pwd
	 * @return String viewName
	 */
	@RequestMapping(value = "/member/login.do", 
					method = RequestMethod.POST)
	public String loginCheck(
			HttpServletRequest request, 
			HttpSession logOnSession, 
			Model model,
			@RequestParam("signin_id") String signin_id, 
			@RequestParam("signin_pwd") String signin_pwd) {

		MemberDTO memberDTO = memberService.getLoginResult(signin_id, signin_pwd);

		logOnSession = request.getSession();

		// 최초 세팅은 guest로 강제
		String logOnWhetherForSession = "guest";
		setFailSession(logOnSession, memberDTO, logOnWhetherForSession);

		// 관리자 로그인
		if (memberDTO.getLoginWhether() == 1) {
			setSuccessSession(logOnSession, memberDTO, logOnWhetherForSession);
			return "forward:/member/memberslist.do";
			// 일반회원 로그인
		} else if (memberDTO.getLoginWhether() == 0) {
			setSuccessSession(logOnSession, memberDTO, logOnWhetherForSession);
			return "/sjs/calendarM";
			// 로그인 실패
		} else if (memberDTO.getLoginWhether() == -1) {
			setFailSession(logOnSession, memberDTO, logOnWhetherForSession);
			return "/shm/loginfail";
		} else {
			setFailSession(logOnSession, memberDTO, logOnWhetherForSession);
			return "/shm/loginfail";
		}

	}

	/**
	 * 로그아웃, 동시에 세션 폐기
	 * 
	 * @param model
	 * @param request
	 * @param logOnSession
	 * @return viewName
	 */
	@RequestMapping(value = "/member/logout.do", 
					method = RequestMethod.GET)
	public String logout(
			Model model, 
			HttpServletRequest request, 
			HttpSession logOnSession) {
		logOnSession = request.getSession();

		logOnSession.invalidate();

		return "redirect:/member/login.do"; // 임시
//		return "/sjs/calendarM";
	}

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

		if ((idFindEmailAdd != null && !(idFindEmailAdd.isEmpty()))
				&& (idFindTelNum != null && !(idFindTelNum.isEmpty()))) {

			Map<String, String> idFindMap = new HashMap<String, String>();
			idFindMap.put("emailAdd", idFindEmailAdd);
			idFindMap.put("telNum", idFindTelNum);

			String foundId = memberService.idFinder(idFindMap);

			if (!(foundId.isEmpty())) {
				model.addAttribute("foundId", foundId);
				return "/shm/idfound";
			} else {
				// 조회결과 없음
				return "redirect:/member/rd/idfoundfail";
			}
		} else {
			// 입력칸이 공란, 나중에 자바스크립트로 막기
			return "redirect:/member/rd/idfoundfail";
		}
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
		
		Map<String, Object> pwdRewritingParam = new HashMap<String, Object>();
		pwdRewritingParam.put("id", pwdRewriteId);
		pwdRewritingParam.put("telNum", pwdRewriteTelNum);

		String enquiryResult = memberService.getEnquiryPwdRewriting(pwdRewritingParam);

		if ((pwdRewriteId != null && !(pwdRewriteId.isEmpty()))
				&& (pwdRewriteTelNum != null && !(pwdRewriteTelNum.isEmpty()))) {
			if (!(enquiryResult.equals("fail"))) {
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

	/**
	 * 관리자의 회원목록에서 회원 삭제
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
