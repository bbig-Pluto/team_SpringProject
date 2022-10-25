package com.myspring.syl.shm.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		
		System.out.println("rn_ForAdminSignUp : " + rn_ForAdminSignUp);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		String resultMessage = "";
		
		// 관리자 회원가입
		if ( !(dto.getRn_ForAdminAdd() == null || dto.getRn_ForAdminAdd().equals("") || rn_ForAdminSignUp.isEmpty()) ) {
			int permittingMemberClass = memberService.getPermittingMemberClass(rn_ForAdminSignUp);
			getParamSignUp.put("memberClass", permittingMemberClass);
			
			// 관리자 등급 세팅 여부 체크
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
			// 관리자 등록코드 불일치
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
		// 여러 예외사항 캐치
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
		
		// 슈퍼어드민이 설정한 adminClass 자바 변수로 저장
		int adminClass = Integer.parseInt( (String)setAdminClass.get("setAdminClass"));
		
		// 관리자가 가입할 때 기입해야할 난수 생성
		String generated_code = memberService.setAdminClassGetSignUpCode(adminClass);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String response = "document.querySelector(\"#generated_rn\").value = " + generated_code + ";";
		
		return new ResponseEntity (response, responseHeaders, HttpStatus.CREATED);
	}
	
	/**
	 * 마이페이지 로딩
	 * @param request
	 * @param logOnSession
	 * @param hasedPwd
	 * @return ajax
	 */
	@RequestMapping("/member/mypage")
	public ResponseEntity myPageEntrance(
			HttpServletRequest request,
			HttpSession logOnSession,
			@RequestBody HashMap hasedPwd) {
		
		String inputtedPwd = (String)hasedPwd.get("pwd");
		
		logOnSession = request.getSession();
		String isLogon = "" + logOnSession.getAttribute("isLogon");
		String memberNum = "" + logOnSession.getAttribute("logOn.memberNum");
		
		MemberDTO dto = new MemberDTO();
		dto.setPwd(inputtedPwd);
		dto.setMemberNum(memberNum);
		
		int queryResult = memberService.getQueryResultForMyPage(dto);
		
		String response = "";
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		// 로그인 하지 않고 진입 시도할 경우
		if( !("member".equals(isLogon)) ) {
			response += "location.href='/syl/member/login'";
		
		// 비밀번호 입력을 했다면
		} else {
			// 계정 비밀번호 일치, 비밀번호 입력 팝업창을 닫고 mypage 로 이동 
			if (queryResult == 1) {
				response += "window.opener.location.href='/syl/member/rd/mypage';";
				response += " window.close();";
				
			// 계정 비밀번호 불일치, alret 출력
			} else {
				response += "alert('로그인 계정과 일치하지 않는 비밀번호 입니다.');";
			}
		}
		return new ResponseEntity (response, responseHeaders, HttpStatus.CREATED);
	}

	/**
	 * 마이페이지에서 회원 수정 누르면 DB에서 가져온 data들을 ajax 로 전시
	 * @param request
	 * @param model
	 * @param hasedMemberNum
	 * @return ajax
	 */
	@RequestMapping("/member/getMemberInfo.do")
	public ResponseEntity loadMemberInfo(
			HttpServletRequest request, 
			Model model,
			@RequestBody HashMap hasedMemberNum) {
		String inputtedMemberNum = String.valueOf((Integer)hasedMemberNum.get("memberNum"));
		MemberDTO dto = memberService.getMemberInfo(inputtedMemberNum);
		
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String joinDate = fmt.format(dto.getJoinDate());
		
		String response = "";
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		response += " document.querySelector('#inputModifyingInfoSelf').innerHTML =";
		response += "'<form action=\"/syl/member/modifyInfoSelf.do\" method=\"get\">"
				+ "<table align=\"center\">"
				+ "<caption>회원 정보 수정</caption>"
				+ "<tbody>"
				+ "<tr>"
				+ "<td class=\"modCategory\">아이디 : &nbsp;</td>"
				+ "<td><input class=\"forbidModi\" type=\"text\" name=\"id\" value= \"" + dto.getId() + "\" readonly></td>"
				+ "<td><a href=\"syl/member/rd/idpwdfinder\">아이디 찾기</a></td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td class=\"modCategory\">비밀번호 : &nbsp;</td>"
				+ "<td><input class=\"forbidModi\" type=\"text\" name=\"pwd\" value= \"" + dto.getPwd() + "\" readonly></td>"
				+ "<td><a href=\"syl/member/rd/idpwdfinder\">비밀번호 재설정</a></td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td class=\"modCategory\">전화번호 : &nbsp;</td>"
				+ "<td><input type=\"text\" name=\"telNum\" value= \"" + dto.getTelNum() + "\"></td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td class=\"modCategory\">닉네임 : &nbsp;</td>"
				+ "<td><input type=\"text\" name=\"nickName\" value= \"" + dto.getNickName() + "\"></td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td class=\"modCategory\">이메일 : &nbsp;</td>"
				+ "<td><input type=\"text\" name=\"emailAdd\" value= \"" + dto.getEmailAdd() + "\"></td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td class=\"modCategory\">회원번호 : &nbsp;</td>"
				+ "<td><input class=\"forbidModi\" type=\"text\" name=\"memberNum\" value= \"" + String.valueOf(dto.getMemberNum()) + "\" readonly>"
				+ "</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td class=\"modCategory\">관리등급 : &nbsp;</td>"
				+ "<td><input class=\"forbidModi\" type=\"text\" name=\"memberClass\" value= \"" + dto.getMemberClass() + "\" readonly></td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td class=\"modCategory\">가입일 : &nbsp;</td>"
				+ "<td><input class=\"forbidModi\" type=\"text\" name=\"joinDate\" value= \"" + joinDate + "\" readonly>"
				+ "</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td></td>"
				+ "<td colspan=\"1\"><input type=\"submit\" value=\"완료\">&nbsp;&nbsp;<input type=\"reset\" value=\"다시입력\"></td>"
				+ "</tr>"
				+ "</tbody>"
				+ "</table>"
				+ "</form>'";
		
		return new ResponseEntity (response, responseHeaders, HttpStatus.CREATED);
	}
	
}
