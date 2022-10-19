package com.myspring.syl.shm.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.syl.shm.dao.MemberDAO;
import com.myspring.syl.shm.dto.MemberDTO;

@Service
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
	
	public int exePwdRewriting(Map ctrlParams) {
		int result = memberDAO.pwdRewrting(ctrlParams);
		return result;
	}
	
	
	private int idDupleCheck(String signUpId) {
		int result = 1;
		result = memberDAO.idDupleCheck(signUpId);
		return result;
	}

}
