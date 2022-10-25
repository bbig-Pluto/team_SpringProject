package com.myspring.syl.yyk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.syl.yyk.dao.DiaryDAO;
import com.myspring.syl.yyk.dto.DiaryDTO;

@Service
public class DiaryServiceImpl implements DiaryService{

	@Autowired
	DiaryDAO diaryDAO;

	
	// 일기장 조회
	@Override
	public List<DiaryDTO> getDiaryList(String sessionId) {
		List<DiaryDTO> list = diaryDAO.diaryList(sessionId);
		return list;
	}
//	@Override
//	public List<DiaryDTO> getDiaryList() {
//		List<DiaryDTO> list = diaryDAO.diaryList();
//		return list;
//	}

	// 일기장 추가
	@Override
	public int getAddDiary(DiaryDTO diaryDTO) {
		int result = diaryDAO.addDiary(diaryDTO);
		return result;
	}

	// 일기장 수정
	@Override
	public int getUpdateDiary(DiaryDTO diaryDTO) {
		int result = diaryDAO.updateDiary(diaryDTO);
		return result;
	}
	
	// 일기장 삭제
	@Override
	public int getDelDiary(DiaryDTO diaryDTO) {
		int result = diaryDAO.delDiary(diaryDTO);
		return result;
	}

	// 일기장 검색
	@Override
	public List<DiaryDTO> getSearchDiary(DiaryDTO diaryDTO) {
		List<DiaryDTO> list = diaryDAO.searchDiary(diaryDTO);
		return list;
	}



}
