package com.myspring.syl.shm.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
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
		
		try {
			memberNum = sqlSession.selectOne("mapper.shm.enquiryForPwdRewriting", paramsMap);
			return memberNum;
		
		} catch(NullPointerException e) {
			return memberNum = "fail";
		}
	}
	

}
