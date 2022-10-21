package com.myspring.syl.yyk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.myspring.syl.yyk.dto.DiaryDTO;

public interface DiaryService {

	List<DiaryDTO> getDiaryList();
	
	int getAddDiary(DiaryDTO diaryDTO);
	
	int getUpdateDiary(DiaryDTO diaryDTO);
	
	int getDelDiary(DiaryDTO diaryDTO);
	
	List<DiaryDTO> getSearchDiary(DiaryDTO diaryDTO);
	
}
