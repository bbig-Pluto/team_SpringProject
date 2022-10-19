package com.myspring.syl.shm.service;

import java.util.List;
import java.util.Map;

import com.myspring.syl.shm.dto.MemberDTO;


public interface MemberService {
	
	List<MemberDTO> getMemberList();
	MemberDTO getLoginResult(String signin_id, String signin_pwd);
	public String idFinder(Map idFindKey);
	public int addMemberSvc(Map signUpMap);
	public int getEnquiryPwdRewriting(Map param);
}
