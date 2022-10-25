package com.myspring.syl.lhj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.syl.lhj.dto.DietDTO;
import com.myspring.syl.lhj.service.DietService;

@Controller
public class DietController {

	private static final Logger logger = LoggerFactory.getLogger(ExerciseControllerImpl.class);
	
	@Autowired
	DietService dietService;
	

	/*
	 * 식단일지 메인 페이지                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
	 * @return 메인페이지 접속
	 */
	@RequestMapping(value = "/diet_1page.do", method = RequestMethod.GET)
	public String diet_diary_View() {
		logger.info(" 컨트롤러 : 식단일지 메인 페이지 메소드 실행 ");
		return "lhj/Diet_diary_EL_View";
	};
	
	/**
	 * 식단일지 내용 추가 insert
	 * 
	 * @param model
	 * @param request
	 * @param diet_diary_type
	 * @param diet_diary_menu
	 * @param diet_diary_menu_calorie
	 * @param diet_diary_menu_sum
	 * @return 식단일지 2page
	 */
	@RequestMapping(value = "/diet_insert.do", method = RequestMethod.POST)
	public String diet_insert(
			Model model,
			HttpServletRequest request,
			@RequestParam("diet_diary_type") String diet_diary_type,
			
			@RequestParam("diet_diary_menu") String diet_diary_menu,
			@RequestParam("diet_diary_menu_calorie") int diet_diary_menu_calorie,
			@RequestParam("diet_diary_menu_sum") int diet_diary_menu_sum
			
			
			) {
		logger.info(" 컨트롤러 : 내용 입력 추가 메소드 실행 ");
		DietDTO dietDTO = new DietDTO();
		
		HttpSession userInfo = request.getSession();
		String sessionId_HJ = "" + userInfo.getAttribute("isLogon");	// 오브젝트 타입이라 "" 사용해서 String으로 변경
		
		dietDTO.setSession_user_id_hj(sessionId_HJ);
		dietDTO.setDiet_diary_type(diet_diary_type);
		int diet_insert = dietService.diet_insert(dietDTO);
//		System.out.println(" diet_insert 성공여부 확인 : " + diet_insert);
		// Diet_diary 테이블 내용
		
		
		// Diet_insert_menu 테이블 내용
//		System.out.println("get name" + diet_diary_menu + " " + diet_diary_menu_calorie + " " + diet_diary_menu_sum);
		dietDTO.setDiet_diary_menu(diet_diary_menu);
		dietDTO.setDiet_diary_menu_calorie(diet_diary_menu_calorie);
		dietDTO.setDiet_diary_menu_sum(diet_diary_menu_sum);

		
		
		int diet_insert_menu = dietService.diet_insert_menu(dietDTO);

		diet_list_Last(model); // 식단일지 2page 가장 최근에 기록한 내용 보여줌 
		diet_menu_list(model); // 오른쪽 오늘 먹은 음식
		return "lhj/Diet_diary_EL_View_into";
	};

	/**
	 * 2page 가장 최근에 입력한(마지막 값) 내용 보여줌 (페이지 왼쪽)
	 * 
	 * @param 
	 * @return 식단일지 2page
	 */
	public String diet_list_Last(Model model) {

		DietDTO diet_list_Last = dietService.diet_list_Last();
		model.addAttribute("diet_list_Last", diet_list_Last);
		
		return "lhj/Diet_diary_EL_View.into";
	}
	
	/**
	 * list로 출력하는 메소드 (페이지 오른쪽)
	 * 
	 * @param 
	 * @return 식단일지 2page
	 */
	@RequestMapping(value = "/diet_2page.do", method = RequestMethod.GET)
	public String diet_menu_list(Model model) {
		logger.info(" 컨트롤러 : 2page list 출력 메소드 실행 ");
		
		List<DietDTO> diet_menu_list = dietService.diet_menu_list();
		model.addAttribute("listDiet_diary_menu", diet_menu_list);
		
		diet_list_Last(model);
		return "lhj/Diet_diary_EL_View_into";
	};
	
	/**
	 * 가장 최근에 입력한(마지막 값) 내용 수정
	 * 
	 * @param model
	 * @param diet_diary_menu
	 * @param diet_diary_menu_calorie
	 * @param diet_diary_menu_sum
	 * @return 식단일지 2page
	 */
	@RequestMapping(value = "/diet_update_2page.do", method = RequestMethod.POST)
	public String diet_menu_update(Model model,

			@RequestParam("diet_diary_menu") String diet_diary_menu,
			@RequestParam("diet_diary_menu_calorie") int diet_diary_menu_calorie,
			@RequestParam("diet_diary_menu_sum") int diet_diary_menu_sum
			) {
		logger.info(" 컨트롤러 : 2page update 메소드 실행 ");
		
		DietDTO dietDTO = new DietDTO();
		dietDTO.setDiet_diary_menu(diet_diary_menu);
		dietDTO.setDiet_diary_menu_calorie(diet_diary_menu_calorie);
		dietDTO.setDiet_diary_menu_sum(diet_diary_menu_sum);
		int diet_menu_update = dietService.diet_menu_update(dietDTO);
		
//		System.out.println( " 컨트롤러 diet_menu_update 성공여부 " + diet_menu_update);
		
		diet_list_Last(model); // 왼쪽 마지막 값 내용
		diet_menu_list(model); // 오른쪽 오늘 먹은 음식
		return "lhj/Diet_diary_EL_View_into";
	}
	
	/**
	 * 식단일지 삭제 메소드
	 * 
	 * @param model
	 * @param seq_diet_diary_menu (where 조건)
	 * @return 식단일지 2page
	 */
	@RequestMapping(value = "/diet_delete_2page.do", method = RequestMethod.POST)
	public String diet_menu_delete(Model model,
								   @RequestParam("seq_diet_diary_menu") int seq_diet_diary_menu) {
		logger.info(" 컨트롤러 : 2page update 메소드 실행 ");
		
		int diet_menu_delete = dietService.diet_menu_delete(seq_diet_diary_menu);
		
//		System.out.println(" 컨트롤러 diet_menu_delete 성공여부  " + diet_menu_delete);
		
		diet_list_Last(model); // 왼쪽 마지막 값 내용
		diet_menu_list(model); // 오른쪽 오늘 먹은 음식
		return "lhj/Diet_diary_EL_View_into";
	}
}
