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
	 * 1page ����
	 */
	@RequestMapping(value = "/diet_1page.do", method = RequestMethod.GET)
	public String diet_diary_View() {
		
		return "lhj/Diet_diary_EL_View";
	};
	
	/*
	 * Diet_diary ���̺� insert 
	 * Diet_diary_Menu ���̺� insert 
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
		logger.info("���� ��Ʈ�ѷ� diet_insert �޼ҵ� ���� ����");
		DietDTO dietDTO = new DietDTO();
		
		HttpSession userInfo = request.getSession();
		String sessionId_HJ = "" + userInfo.getAttribute("isLogon");	// ������Ʈ Ÿ���̶� "" �� �ٿ� String���� ����
		dietDTO.setSession_user_id_hj(sessionId_HJ);
		dietDTO.setDiet_diary_type(diet_diary_type);
		int diet_insert = dietService.diet_insert(dietDTO);
		System.out.println("1�� ������ ���� diet_insert : " + diet_insert);
		// �� Diet_diary ���̺�
		
		// �� Diet_insert_menu ���̺�
		System.out.println("get name" + diet_diary_menu + " " + diet_diary_menu_calorie + " " + diet_diary_menu_sum);
		dietDTO.setDiet_diary_menu(diet_diary_menu);
		dietDTO.setDiet_diary_menu_calorie(diet_diary_menu_calorie);
		dietDTO.setDiet_diary_menu_sum(diet_diary_menu_sum);
//		
//		
//		
		int diet_insert_menu = dietService.diet_insert_menu(dietDTO);
		System.out.println("1�� ������ ���� diet_insert_menu : " + diet_insert_menu);
		diet_list_Last(model); // �̵� �� ������ OO ǥ��
		diet_menu_list(model); // 오른쪽 오늘 먹은 음식
		return "lhj/Diet_diary_EL_View_into";
	};
	
	/*
	 * 2page ����
	 * list ������
	 */
	@RequestMapping(value = "/diet_2page.do", method = RequestMethod.GET)
	public String diet_menu_list(Model model) {
		logger.info("���� ��Ʈ�ѷ� diet_list �޼ҵ� ���� ����");
		
		List<DietDTO> diet_menu_list = dietService.diet_menu_list();
		model.addAttribute("listDiet_diary_menu", diet_menu_list);
		
		diet_list_Last(model);
		return "lhj/Diet_diary_EL_View_into";
	};
	
	
	/*
	 * 2page 마지막 값 출력해주는 메소드 맵핑x
	 */
	public String diet_list_Last(Model model) {

		DietDTO diet_list_Last = dietService.diet_list_Last();
		model.addAttribute("diet_list_Last", diet_list_Last);
		
		return "lhj/Diet_diary_EL_View.into";
	}
	
	/*
	 * 2page update 해주는 메소드
	 */
	@RequestMapping(value = "/diet_update_2page.do", method = RequestMethod.POST)
	public String diet_menu_update(Model model,
			@RequestParam("diet_diary_menu") String diet_diary_menu,
			@RequestParam("diet_diary_menu_calorie") int diet_diary_menu_calorie,
			@RequestParam("diet_diary_menu_sum") int diet_diary_menu_sum
			) {

		DietDTO dietDTO = new DietDTO();

		dietDTO.setDiet_diary_menu(diet_diary_menu);
		dietDTO.setDiet_diary_menu_calorie(diet_diary_menu_calorie);
		dietDTO.setDiet_diary_menu_sum(diet_diary_menu_sum);
		int diet_menu_update = dietService.diet_menu_update(dietDTO);
		
		System.out.println( " 컨트롤러 diet_menu_update 성공여부 " + diet_menu_update);
		
		diet_list_Last(model);
		diet_menu_list(model); // 오른쪽 오늘 먹은 음식
		return "lhj/Diet_diary_EL_View_into";
	}
	
	/*
	 * 2page delete 해주는 메소드
	 */
	@RequestMapping(value = "/diet_delete_2page.do", method = RequestMethod.POST)
	public String diet_menu_delete(Model model,
								   @RequestParam("seq_diet_diary_menu") int seq_diet_diary_menu) {
		
		int diet_menu_delete = dietService.diet_menu_delete(seq_diet_diary_menu);
		
		System.out.println(" 컨트롤러 diet_menu_delete 성공여부  " + diet_menu_delete);
		
		diet_list_Last(model); // 왼쪽 오늘의 아침
		diet_menu_list(model); // 오른쪽 오늘 먹은 음식
		return "lhj/Diet_diary_EL_View_into";
	}
}
