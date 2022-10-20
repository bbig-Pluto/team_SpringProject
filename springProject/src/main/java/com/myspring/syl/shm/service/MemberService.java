package com.myspring.syl.shm.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.syl.shm.dto.MemberDTO;

@Transactional(propagation=Propagation.REQUIRED)
public interface MemberService {
	
	List<MemberDTO> getMemberList();
	MemberDTO getLoginResult(String signin_id, String signin_pwd);
	public String idFinder(Map idFindKey);
	public int addMemberSvc(Map signUpMap);
	public String getEnquiryPwdRewriting(Map ctrlParams);
	public int exePwdRewriting(Map ctrlParams);
	public int exeDelMemFromAdmin(String memberNum);
	public MemberDTO getMemberInfoForModify(String memberNum);
	public int exeModifyMemberInfo(MemberDTO dto);
	public int exeDeleteAccountSelf(String memberNum);
	public MemberDTO getMemberInfo(String memberNum);
	public int exeModifyInfoSelf(MemberDTO dto);
	
}
