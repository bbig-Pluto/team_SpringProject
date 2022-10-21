package com.myspring.syl.sdy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.syl.sdy.dto.QaDTO;


@Repository
public class QaDAO {

	@Autowired
	SqlSession sqlSession;
	//모든 리스트
	public List<QaDTO> selectQaMember() {
		List<QaDTO> list =sqlSession.selectList("mapper.sdy.selectAllQaList");
		return list;
	}
	//글 등록
	public void insertQaContents(QaDTO qaDTO) {
		sqlSession.insert("mapper.sdy.insertQaContents",qaDTO);
	}
	//글수정
	public void modQaList(QaDTO qaDTO) {
		sqlSession.update("mapper.sdy.updateQaContent", qaDTO);
	}
	//체크 선택시 삭제
	public void delQaContents(List q_no) {
		System.out.println("q_no 다오에서"+q_no);
		sqlSession.delete("mapper.sdy.deleteQaMember",q_no);		
		}
	}
