package com.myspring.syl.shm.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		dto = memberDAO.checkToLogin(signin_id, signin_pwd);
		
		// 로그인 성공, 실패 여부부터 분기
		if ( (dto.getId() != null) || (dto.getId().equals("")) ) {
			// 로그인 성공(관리자)
			if (Integer.parseInt(dto.getMemberNum()) >= 900001 
					&& dto.getMemberClass() >= 1) {
				dto.setLoginWhether(1);

			// 로그인 성공(일반회원)
			} else if (Integer.parseInt(dto.getMemberNum()) < 900001 
					&& dto.getMemberClass() == 0) {
				dto.setLoginWhether(0);
			}
		// 로그인 실패
		} else {
			dto.setLoginWhether(-1);
		}

		return dto;
	}

}
