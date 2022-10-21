package com.myspring.syl.shm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.syl.shm.dto.MemberDTO;


@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public List listMembers() {
		List<MemberDTO> membersList = sqlSession.selectList("mapper.shm.selectAllMemberList");
		
		return membersList;
	}
	
	// 로그인 체크
	@Override
	public MemberDTO checkToLogin(String signin_id, String signin_pwd) {
		MemberDTO dto = new MemberDTO();
		dto.setId(signin_id);
		dto.setPwd(signin_pwd);
		
		dto = sqlSession.selectOne("mapper.shm.loginResult", dto);
		
		return dto;
	}
	
	// 아이디 찾기
	@Override
	public String idFinder(Map idFindKey) {
		String idFound = sqlSession.selectOne("mapper.shm.idSearching", idFindKey);
		return idFound;
	}

	// 회원가입 전 ID 중복체크
	@Override
	public int idDupleCheck (String dupleCheckId) {
		int idDupleResult = sqlSession.selectOne("mapper.shm.idDupleCheck", dupleCheckId);
		System.out.println("idDupleResult in DAO : " + idDupleResult);
		return idDupleResult;
	}
	
	// 회원가입
	@Override
	public int addMemberDAO(Map signUpMap) {
		int resultOfInsertMember = sqlSession.insert("mapper.shm.addMember", signUpMap);
		return resultOfInsertMember;
	}
	
	// 비밀번호 변경 위한 회원조회
	@Override
	public String enquiryPwdRewriting(Map paramsMap) {
		String memberNum = "";
		memberNum = sqlSession.selectOne("mapper.shm.enquiryForPwdRewriting", paramsMap);
			
		if (memberNum == null) {
			return memberNum = "fail";
		} else {
			return memberNum;
		}
	}
	
	// 사용자가 입력한 새로운 비밀번호로 변경 실행
	@Override
	public int pwdRewrting(Map memberNumAndNewPwd) {
		int result = sqlSession.update("mapper.shm.reWritingNewPwd", memberNumAndNewPwd);
		
		return result;
	}
	
	// 관리자 페이지의 회원삭제
	@Override
	public int delMemFromAdmin(String memberNum) {
		int result = sqlSession.delete("mapper.shm.delMemFromAdmin", memberNum);
		
		return result;
	}
	
	// 관리자 페이지 회원 정보 수정을 위해 회원 DB 조회
	@Override
	public MemberDTO enquireMemberFromAdmin(String memberNum) {
		MemberDTO dto = sqlSession.selectOne("mapper.shm.enquireMemFromAdmin", memberNum);
		
		return dto;
	}
	
	// 관리자 페이지 회원 정보 수정 반영
	@Override
	public int updateMemberInfo(MemberDTO dto) {
		int result = sqlSession.update("mapper.shm.modifyMemInfoFromAdmin", dto);
		return result;
	}
	
	// 마이페이지 직접 회원탈퇴
	@Override
	public int deleteAccountInfo(String memberNum) throws DataAccessException {
		int result = sqlSession.delete("mapper.shm.delAccountInfoSelf", memberNum);
		return result;
	}
	
	// 마이페이지 다이어리 정보 초기화
	@Override
	public int deleteDiaryContents(String memberNum) throws DataAccessException {
		int result = sqlSession.delete("mapper.shm.deleteDiaryContents", "test01");
		return result;
	}
	
	// 마이페이지 운동 정보 초기화
	@Override
	public int deleteExerciseContents(String memberNum) throws DataAccessException {
		int result = sqlSession.delete("mapper.shm.deleteExerciseContents", "test01");
		return result;
	}
	
	// 마이페이지 위시리스트 정보 초기화
//	@Override
//	public int deleteWishListContents(String memberNum) throws DataAccessException {
//		int result = sqlSession.delete("mapper.shm.deleteWishListContents", "test01");
//		return result;
//	}
	
	// 마이페이지에서 로그인 한 회원의 정보 다시 가져오기
	@Override
	public MemberDTO memberInfoForModify(String memberNum) {
		MemberDTO dto = sqlSession.selectOne("mapper.shm.memberInfoForModify", memberNum);
		
		return dto;
	}
	
	// 마이페이지에서 입력한 회원정보 수정 데이터 반영
	public int modifyMemberInfoSelf(MemberDTO dto) {
		int result = sqlSession.update("mapper.shm.modifyMemberInfoSelf", dto);
		
		return result;
	}
	
	public int queryResultForMyPage(MemberDTO dto) {
		int result = sqlSession.selectOne("mapper.shm.queryResultForMyPage", dto);
		return result;
	}
}
