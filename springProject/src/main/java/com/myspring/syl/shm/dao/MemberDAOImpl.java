package com.myspring.syl.shm.dao;

import java.util.List;


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
	
	public MemberDTO checkToLogin(String signin_id, String signin_pwd) {
		
		MemberDTO dto = new MemberDTO();
//		MemberDTO loginCheckResult = new MemberDTO();
		dto.setId(signin_id);
		dto.setPwd(signin_pwd);
		
		dto = sqlSession.selectOne("mapper.shm.loginResult", dto);
		
		return dto;
	}

}
