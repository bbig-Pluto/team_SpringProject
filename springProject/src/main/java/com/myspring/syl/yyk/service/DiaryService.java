package com.myspring.syl.yyk.service;

import java.util.List;
import java.util.Map;

import com.myspring.syl.yyk.dto.DiaryDTO;

public interface DiaryService {
	
	// 일기장 조회(페이징)
	Map getDiaryList(Map map);
	
	// 일기장 추가
	int getAddDiary(DiaryDTO diaryDTO);
	
	// 일기장 수정
	int getUpdateDiary(DiaryDTO diaryDTO);
	
	// 일기장 삭제
	int getDelDiary(DiaryDTO diaryDTO);
	
	// 일기장 검색
	List<DiaryDTO> getSearchDiary(DiaryDTO diaryDTO);
	
	
}
