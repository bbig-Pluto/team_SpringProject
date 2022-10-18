package com.myspring.syl.yyk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myspring.syl.yyk.dto.DiaryDTO;
import com.myspring.syl.yyk.service.DiaryService;

@Controller
public class DiaryController {

	@Autowired
	DiaryService diaryService;
//	@Autowired
//	DiaryDTO diaryDTO; // DTO는 빈 생성해주는 애너테이션 안써서 Autowired 쓰면 안 됨
	
	
	// 일기장 조회
	@RequestMapping(value="/diaryList", method= {RequestMethod.GET, RequestMethod.POST})
	public String diaryList(Model model) {
		List<DiaryDTO> list = diaryService.getDiaryList();

		model.addAttribute("list", list);
		
		return "/yyk/diaryList";
	}
	
	// 일기장 추가
	@RequestMapping(value="/addDiary", method = {RequestMethod.GET, RequestMethod.POST})
	public String addDiary(Model model,
							// 입력 받은 값 알아서 저장해줌
							@ModelAttribute DiaryDTO diaryDTO ) {
		
		System.out.println(">>> addDiary controller route");
		System.out.println("addDiary : title : " + diaryDTO.getD_title());
		System.out.println("addDiary : content : " + diaryDTO.getD_content());
		
		int result = diaryService.getAddDiary(diaryDTO);
//		System.out.println("controller : intsert된 행 개수 : " + result);
//		model.addAttribute("diaryDTO", diaryDTO);
		
		return "redirect:/diaryList";
	}
	
	// 일기장 수정
	@RequestMapping(value="/updateDiary", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateDiary(Model model,
							// 입력 받은 값 알아서 저장해줌
							@ModelAttribute("diaryDTO") DiaryDTO diaryDTO) {
		
		System.out.println(">>> updateDiary controller route");
		System.out.println("updateDiary : title : " + diaryDTO.getD_title());
		System.out.println("updateDiary : content : " + diaryDTO.getD_content());
		
		int result = diaryService.getUpdateDiary(diaryDTO);
		System.out.println("controller : update된 행 개수 : " + result);
//		model.addAttribute("diaryDTO", diaryDTO);
		
		return "redirect:/diaryList";
	}
	
	// 일기장 삭제
	@RequestMapping(value="/delDiary", method= {RequestMethod.GET, RequestMethod.POST})
	public String delDiary(Model model,
							// 입력 받은 값 알아서 저장해줌
							@ModelAttribute DiaryDTO diaryDTO) {
			
		System.out.println(">>> delDiary controller route");
		System.out.println("delDiary : title : " + diaryDTO.getD_title());
		System.out.println("delDiary : content : " + diaryDTO.getD_content());
			
		int result = diaryService.getDelDiary(diaryDTO);
//		System.out.println("controller : delete된 행 개수 : " + result);
//		model.addAttribute("diaryDTO", diaryDTO);
			
		return "redirect:/diaryList";
	}
	
	// 일기장 검색
	@RequestMapping(value="/searchDiary", method= {RequestMethod.GET, RequestMethod.POST})
	public String searchDiary(Model model,
							// 입력 받은 값 알아서 저장해줌
							// 입력 받은 d_title만 dto에 값 저장 해주고
							// 나머지 필드는 초기값 (null)
							@ModelAttribute DiaryDTO diaryDTO) {
			
		System.out.println(">>> searchDiary controller route");
		System.out.println("searchDiary : title : " + diaryDTO.getD_title());
			
		List<DiaryDTO> list = diaryService.getSearchDiary(diaryDTO);
//		model.addAttribute("diaryDTO", diaryDTO);
			
		model.addAttribute("list", list);
		
		return "/yyk/searchDiary";
	}
	
	
	
		// 일기장 추가 페이지로 이동
		@RequestMapping(value="/addDiaryList", method=RequestMethod.GET)
		public String addDiaryList(Model model) {
			System.out.println("다이어리 추가 페이지로 이동");
			
			return "/yyk/addDiary";
		}
		
		// 일기장 상세 페이지로 이동
		@RequestMapping(value="/detailDiary", method=RequestMethod.GET)
		public String detailDiary(Model model) {
			System.out.println("다이어리 상세 페이지로 이동");
			
			return "/yyk/detailDiary";
		}
}
