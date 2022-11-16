package com.myspring.syl.yyk.dao;

import java.util.List;
import java.util.Map;

import com.myspring.syl.yyk.dto.DiaryDTO;

public interface DiaryDAO {

	// 일기장 조회(페이징)
	List diaryList(Map map);
	
	// 일기장 목록 개수
	public int listCount(Map map);
	
	// 일기장 추가
	int addDiary(DiaryDTO dto); 
	
	// 일기장 수정
	int updateDiary(DiaryDTO dto);
	
	// 일기장 삭제
	int delDiary(DiaryDTO dto);

	// 일기장 검색
	List<DiaryDTO> searchDiary(DiaryDTO dto);
	

}
