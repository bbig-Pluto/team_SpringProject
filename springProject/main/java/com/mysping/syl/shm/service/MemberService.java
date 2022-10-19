package com.myspring.syl.shm.service;

import java.util.List;
import java.util.Map;

import com.myspring.syl.shm.dto.MemberDTO;


public interface MemberService {
	
	List<MemberDTO> getMemberList();
	
	public int exePwdRewriting(Map ctrlParams);
	public int exeDelMemFromAdmin(String memberNum);
	
}
