package com.myspring.syl.yyk.dao;

import java.util.List;

import com.myspring.syl.yyk.dto.DiaryDTO;

public interface DiaryDAO {

	List<DiaryDTO> diaryList(String sessionId);
//	List<DiaryDTO> diaryList();
	
	int addDiary(DiaryDTO dto); 
	
	int updateDiary(DiaryDTO dto);
	
	int delDiary(DiaryDTO dto);

	List<DiaryDTO> searchDiary(DiaryDTO dto);
	

}
