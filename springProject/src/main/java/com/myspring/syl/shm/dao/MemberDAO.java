package com.myspring.syl.shm.dao;

import java.util.List;
import java.util.Map;

import com.myspring.syl.shm.dto.MemberDTO;

public interface MemberDAO {
	public List listMembers();
	public MemberDTO checkToLogin(String signin_id, String signin_pwd);
	public String idFinder(Map idFindKey);
	public int addMemberDAO(Map signUpMap);
	public int idDupleCheck (String signUpId);
	public String enquiryPwdRewriting(Map paramsMap);
}
