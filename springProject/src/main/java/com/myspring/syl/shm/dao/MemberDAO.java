package com.myspring.syl.shm.dao;

import java.util.List;

import com.myspring.syl.shm.dto.MemberDTO;

public interface MemberDAO {
	public List listMembers();
	public MemberDTO checkToLogin(String signin_id, String signin_pwd);
}
