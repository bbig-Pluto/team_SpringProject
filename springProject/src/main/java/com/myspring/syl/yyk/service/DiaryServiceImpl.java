package com.myspring.syl.yyk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Map getDiaryList(Map map1) {
		
		// map을 바로 string으로 바꾸려고 해서 안됨
//		int pageNum = Integer.parseInt((String)m.get("pageNum"));
//		int countPerPage = Integer.parseInt((String)m.get("countPerPage"));
		
		String str_pageNum = String.valueOf(map1.get("pageNum"));
		String str_countPerPage = String.valueOf(map1.get("countPerPage"));
		String sessionId = String.valueOf(map1.get("sessionId"));
		
		int pageNum = Integer.parseInt(str_pageNum);
		int countPerPage = Integer.parseInt(str_countPerPage);
		
		System.out.println("service : pageNum : " + pageNum);
		System.out.println("service : countPerPage : " + countPerPage);
		System.out.println("service : sessionId : " + sessionId);
		
		int start=0, end=0;
		start = ((pageNum-1) * countPerPage) + 1;  // 페이지당 스타트 페이지 구하기
//		end = pageNum * countPerPage;
		end = start + countPerPage - 1;
		
		/*
		 * 1페이지 5개씩
		 * 		start=1, end=5
		 * 2페이지 5개씩
		 * 		start=6, end=10
		 * 3페이지 5개씩
		 * 		start=11, end=15
		 */
		
		map1.put("start", start);
		map1.put("end", end);
		
		List list = diaryDAO.diaryList(map1);
		int count = diaryDAO.listCount(map1);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("count", count);
		
		return map;
	}

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
