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
	public int pwdRewrting(Map memberNumAndNewPwd);
	public int delMemFromAdmin(String memberNum);
	public MemberDTO enquireMemberFromAdmin(String memberNum);
	public int updateMemberInfo(MemberDTO dto);
	public int deleteAccountInfo(String memberNum);
	public int deleteDiaryContents(String memberNum);
	public int deleteExerciseContents(String memberNum);
//	public int deleteWishListContents(String memberNum);
	public MemberDTO memberInfoForModify(String memberNum);
	public int modifyMemberInfoSelf(MemberDTO dto);
}
