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

	@Override
	public List<MemberDTO> getMemberList() {
		return memberDAO.listMembers();
	}

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
	
	@Override
	public String idFinder(Map idFindKey) {
		String foundId;
		foundId = memberDAO.idFinder(idFindKey);
		
		return foundId;
	}
	
	@Override
	public int addMemberSvc(Map signUpMap) {
		String signUpId = (String) signUpMap.get("id");
		int result = idDupleCheck(signUpId);
		
		int resultOfInsertMember = 0;
		
		if( result == 0 ) {
			return resultOfInsertMember = memberDAO.addMemberDAO(signUpMap);
		} else {
			// 중복 ID 존재, 회원가입 실패
			return resultOfInsertMember;
		}
	}
	
	@Override
	public String getEnquiryPwdRewriting(Map ctrlParams) {
		String result = memberDAO.enquiryPwdRewriting(ctrlParams);
		
		return result;
	}
	
	@Override
	public int exePwdRewriting(Map ctrlParams) {
		int result = memberDAO.pwdRewrting(ctrlParams);
		return result;
	}
	
	@Override
	public int exeDelMemFromAdmin(String memberNum) {
		
		int result = memberDAO.delMemFromAdmin(memberNum);
		
		return result;
	}
	
	private int idDupleCheck(String signUpId) {
		int result = 1;
		result = memberDAO.idDupleCheck(signUpId);
		return result;
	}
	
	@Override
	public MemberDTO getMemberInfoForModify(String memberNum) {
		MemberDTO dto = memberDAO.enquireMemberFromAdmin(memberNum);
		
		return dto;
	}
	
	@Override
	public int exeModifyMemberInfo(MemberDTO dto) {
		int result = memberDAO.updateMemberInfo(dto);
		return result;
	}
	
	@Override
	public int exeDeleteAccountSelf(String memberNum) {
		int resultAccountInfoDel = memberDAO.deleteAccountInfo(memberNum);
		int resultDiaryDel = memberDAO.deleteDiaryContents(memberNum);
		int resultExerciseDel = memberDAO.deleteExerciseContents(memberNum);
//		int resultWishListDel = memberDAO.deleteWishListContents(memberNum);
//		
//		int total = resultAccountDel + resultDiaryDel + resultExerciseDel + resultWishListDel;
		System.out.println("exeDeleteAccountSelf total : " 
				+ (resultAccountInfoDel + resultDiaryDel + resultExerciseDel));
		
		return resultAccountInfoDel;
//		return total;
	}
	
	@Override
	public MemberDTO getMemberInfo(String memberNum) {
		MemberDTO dto = memberDAO.memberInfoForModify(memberNum);
		return dto;
	}
	
	@Override
	public int exeModifyInfoSelf(MemberDTO dto) {
		int result = memberDAO.modifyMemberInfoSelf(dto);
		return result;
	}
	
	@Override
	public int getQueryResultForMyPage(MemberDTO dto) {
		int result = memberDAO.queryResultForMyPage(dto);
		return result;
	}
	
	public int getPermittingMemberClass(String rn_ForAdminSignUp) {
		int result = memberDAO.enquiryPermittingMemberClass(rn_ForAdminSignUp);
		return result;
	}
	
	
	public String setAdminClassGetSignUpCode(int adminClass) {
		
		// 가입할 admin의 관리등급 설정
		int result = memberDAO.setAdminClass(adminClass);
		System.out.println("result setAdminClass : " + result);
		
		// admin 회원가입에 필요한 4자리 코드 DB에 설정, 반환
		String signUpCode = memberDAO.getSignUpCode();
		
		return signUpCode;
	}
	
}
