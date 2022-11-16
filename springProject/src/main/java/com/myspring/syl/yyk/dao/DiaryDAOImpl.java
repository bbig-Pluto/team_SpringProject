package com.myspring.syl.yyk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.MappingSqlQuery;
import org.springframework.stereotype.Repository;

import com.myspring.syl.yyk.dto.DiaryDTO;

@Repository
public class DiaryDAOImpl implements DiaryDAO {

	@Autowired
	SqlSession sqlSession;
	
	// 일기장 조회
	@Override
	public List diaryList(Map map1) {
		String sessionId = (String)map1.get("sessionId");
		System.out.println("dao : sessionId : " + sessionId);
		List list = sqlSession.selectList("mapper.yyk.diaryList", map1);
		return list;
	}
	
	// 일기장 목록 전체 개수
	@Override
	public int listCount(Map map1) {
		int result = sqlSession.selectOne("mapper.yyk.listCount", map1);
		return result;
	}	

	// 일기장 추가
	@Override
	public int addDiary(DiaryDTO dto) {
		int result = sqlSession.insert("mapper.yyk.addDiary", dto);
		return result;
	}
	
	// 일기장 수정
	@Override
	public int updateDiary(DiaryDTO dto) {
		int result = sqlSession.update("mapper.yyk.updateDiary", dto);
		return result;
	}

	// 일기장 삭제
	@Override
	public int delDiary(DiaryDTO dto) {
		int result = sqlSession.delete("mapper.yyk.delDiary", dto);
		return result;
	}

	// 일기장 검색
	@Override
	public List<DiaryDTO> searchDiary(DiaryDTO dto) {
		List<DiaryDTO> list = sqlSession.selectList("mapper.yyk.searchDiary", dto);
		return list;
	}



}
