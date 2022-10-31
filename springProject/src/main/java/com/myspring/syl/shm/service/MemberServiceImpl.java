package com.myspring.syl.shm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.syl.shm.dao.MemberDAO;
import com.myspring.syl.shm.dto.MemberDTO;

@Service
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;

	// 회원정보 조회
	@Override
	public List<MemberDTO> getMemberList() {
		return memberDAO.listMembers();
	}

	// 로그인 체크
	@Override
	public MemberDTO getLoginResult(String signin_id, String signin_pwd) {
		MemberDTO dto = new MemberDTO();
		try {
			dto = memberDAO.checkToLogin(signin_id, signin_pwd);
			// 로그인 성공(관리자)
			if (Integer.parseInt(dto.getMemberNum()) >= 900001 && dto.getMemberClass() >= 1) {
				System.out.println();
				dto.setLoginWhether(1);

			// 로그인 성공(일반회원)
			} else if (Integer.parseInt(dto.getMemberNum()) < 900001 && dto.getMemberClass() == 0) {
				dto.setLoginWhether(0);
			}

		} catch (NullPointerException e) {
			// 쿼리 조회 결과 없음( = 로그인 실패)
			dto = new MemberDTO();
			dto.setLoginWhether(-1);
		}
		return dto;
	}
	
	// 아이디 찾기
	@Override
	public String idFinder(Map idFindKey) {
		String foundId;
		foundId = memberDAO.idFinder(idFindKey);
		
		return foundId;
	}
	
	// 회원가입
	@Override
	public int addMemberSvc(Map signUpMap) {
		String signUpId = (String) signUpMap.get("id");
		int result = idDupleCheck(signUpId); // 중복 id 회원 여부 조회
		
		int resultOfInsertMember = 0;
		
		if( result == 0 ) {
			return resultOfInsertMember = memberDAO.addMemberDAO(signUpMap);
		} else {
			// 중복 ID 존재, 회원가입 실패
			return resultOfInsertMember;
		}
	}
	
	// 비밀번호 찾기 전 계정 존재 조회
	@Override
	public String getEnquiryPwdRewriting(Map ctrlParams) {
		String result = memberDAO.enquiryPwdRewriting(ctrlParams);
		return result;
	}
	
	// 비밀번호 재설정 반영
	@Override
	public int exePwdRewriting(Map ctrlParams) {
		int result = memberDAO.pwdRewrting(ctrlParams);
		return result;
	}
	
	// 회원삭제
	@Override
	public int exeDelMemFromAdmin(String memberNum) {
		int result = memberDAO.delMemFromAdmin(memberNum);
		return result;
	}
	
	// ajax 회원가입 직전 아이디 중복 체크 
	private int idDupleCheck(String signUpId) {
		int result = 1;
		result = memberDAO.idDupleCheck(signUpId);
		return result;
	}
	
	// 슈퍼어드민 페이지에서 회원 정보 수정을 위해 전시할 DB 조회
	@Override
	public MemberDTO getMemberInfoForModify(String memberNum) {
		MemberDTO dto = memberDAO.enquireMemberFromAdmin(memberNum);
		return dto;
	}
	
	// 슈퍼어드민 페이지에서 회원 정보 수정 반영
	@Override
	public int exeModifyMemberInfo(MemberDTO dto) {
		int result = memberDAO.updateMemberInfo(dto);
		return result;
	}
	
	// 마이페이지 회원탈퇴
	@Override
	public int exeDeleteAccountSelf(String memberNum) {
		int resultAccountInfoDel = memberDAO.deleteAccountInfo(memberNum);
		int resultDiaryDel = memberDAO.deleteDiaryContents(memberNum);
		int resultExerciseDel = memberDAO.deleteExerciseContents(memberNum);
//		int resultWishListDel = memberDAO.deleteWishListContents(memberNum); // 위시리스트 초기화
//		
//		int total = resultAccountDel + resultDiaryDel + resultExerciseDel + resultWishListDel;
		System.out.println("exeDeleteAccountSelf total : " 
				+ (resultAccountInfoDel + resultDiaryDel + resultExerciseDel));
		
		return resultAccountInfoDel;
//		return total;
	}
	
	// 마이페이지 회원 정보 수정을 위해 전시할 DB 조회
	@Override
	public MemberDTO getMemberInfo(String memberNum) {
		MemberDTO dto = memberDAO.memberInfoForModify(memberNum);
		return dto;
	}
	
	// 마이페이지에서 회원 정보 수정 반영
	@Override
	public int exeModifyInfoSelf(MemberDTO dto) {
		int result = memberDAO.modifyMemberInfoSelf(dto);
		return result;
	}
	
	// 마이페이지 진입 전 비밀번호 입력 체크
	@Override
	public int getQueryResultForMyPage(MemberDTO dto) {
		int result = memberDAO.queryResultForMyPage(dto);
		return result;
	}
	
	// 관리자 코드를 이용해서 관리자 가입시 부여될 관리자 등급 조회
	@Override
	public int getPermittingMemberClass(String rn_ForAdminSignUp) {
		int result = memberDAO.enquiryPermittingMemberClass(rn_ForAdminSignUp);
		return result;
	}
	
	// 관리자 회원가입에서 관리자 코드 체크
	@Override
	public String setAdminClassGetSignUpCode(int adminClass) {
		
		// 가입할 admin의 관리등급 설정
		int result = memberDAO.setAdminClass(adminClass);
		System.out.println("result setAdminClass : " + result);
		
		// admin 회원가입에 필요한 4자리 코드 DB에 설정, 반환
		String signUpCode = memberDAO.getSignUpCode();
		
		return signUpCode;
	}
	
	// 슈퍼어드민 전용 로그인
	public MemberDTO superLogin(String signin_id, String signin_pwd) {
		MemberDTO dto = new MemberDTO();
		try {
			dto = memberDAO.superLogin(signin_id, signin_pwd);
			// 로그인 성공(관리자)
			if (Integer.parseInt(dto.getMemberNum()) >= 900001 && dto.getMemberClass() >= 1) {
				System.out.println();
				dto.setLoginWhether(1);

			// 로그인 성공(일반회원)
			} else if (Integer.parseInt(dto.getMemberNum()) < 900001 && dto.getMemberClass() == 0) {
				dto.setLoginWhether(0);
			}

		} catch (NullPointerException e) {
			// 쿼리 조회 결과 없음( = 로그인 실패)
			dto = new MemberDTO();
			dto.setLoginWhether(-1);
		}
		return dto;
	}
	
}
