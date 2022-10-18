package com.myspring.syl.lhj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.syl.HomeController;
import com.myspring.syl.lhj.dto.ExerciseDTO;
import com.myspring.syl.lhj.service.ExerciseService;

@Controller
public class ExerciseControllerImpl implements ExerciseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ExerciseControllerImpl.class);
	
	@Autowired
	ExerciseService exerciseservice;

	@Override
	@RequestMapping(value = "/ec_list.do", method = RequestMethod.GET)
	public String selectAllList(Model model) {
		logger.info("■■■ 컨트롤러 list 메소드 실행 ■■■");
		
		List<ExerciseDTO> exercise_list = exerciseservice.selectAllList();
		model.addAttribute("exercise_list", exercise_list);

		return "lhj/ec_list";
	}

	@Override
	@RequestMapping(value = "/exercise/ec_add.do", method = RequestMethod.POST)
	public String add(@RequestParam("exercise_Contents") String exercise_Contents,
					  @RequestParam("exercise_Time") String exercise_Time,
					  Model model) {
		logger.info("■■■ 컨트롤러 add 메소드 실행 ■■■");
		System.out.println("exercise_Contents " + exercise_Contents);
		System.out.println("exercise_Time " + exercise_Time);
		ExerciseDTO dto = new ExerciseDTO();
		dto.setExercise_Contents(exercise_Contents);
		dto.setExercise_Time(exercise_Time);
		
		exerciseservice.ec_insert(dto);
		selectAllList(model);	// 리스트만 있는 메소드
		return "lhj/ec_list";
	}

	@Override
	@RequestMapping(value = "/exercise/ec_del.do", method = RequestMethod.POST)
	public String del(@RequestParam("seq_Exercise") int[] seq_Exercise,
					  Model model) {
		logger.info("■■■ 컨트롤러 del 메소드 실행 ■■■");
		
		for(int i=0; i<seq_Exercise.length; i++) {
		System.out.println("seq_Exercise : " + seq_Exercise[i]);
		};
//		dto.setSeq_Exercise(seq_Exercise);
		
		exerciseservice.ec_delete(seq_Exercise);
		selectAllList(model);	// 리스트만 있는 메소드

		return "lhj/ec_list";
	}

	@Override
	@RequestMapping(value = "/exercise/ec_update.do", method = RequestMethod.POST)
	public String update(@RequestParam("seq_Exercise") int[] seq_Exercise,
						 Model model) {
		logger.info("■■■ 컨트롤러 del 메소드 실행 ■■■");
		
		for(int i=0; i<seq_Exercise.length; i++) {
		System.out.println("seq_Exercise : " + seq_Exercise[i]);
		};
		return "lhj/ec_list";
	}

}
