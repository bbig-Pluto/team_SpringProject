package com.myspring.syl.sdy.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.syl.sdy.dao.QaDAO;
import com.myspring.syl.sdy.dto.QaDTO;




@Service
public class QaService {

	@Autowired
	QaDAO qaDAO;
	//전체 리스트
	public List<QaDTO> getQaList() {
		return qaDAO.selectQaMember();
	
	}
	//글 등록
		public void getQaInsertList(QaDTO qaDTO) {
			qaDAO.insertQaContents(qaDTO);	
		}
	//글수정
	public void getQaModList(QaDTO qaDTO){
		qaDAO.modQaList(qaDTO);
	}

	//체크시 삭제
	public void getQaDelList(List q_no){
		qaDAO.delQaContents(q_no);
	}
	
	
}
