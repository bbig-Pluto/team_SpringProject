package com.myspring.syl.lhj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myspring.syl.lhj.dto.ExerciseDTO;
import com.myspring.syl.lhj.service.ExerciseService;

@Controller("exerciseController")
public class ExerciseControllerImpl implements ExerciseController {
	
	@Autowired
	ExerciseService exerciseservice;
	
	@Override
	@RequestMapping(value="/ec_list.do", method=RequestMethod.GET)
	public String selectAllList(Model model) {
		List<ExerciseDTO> exercise_list = exerciseservice.selectAllList();
		model.addAttribute("exercise_list", exercise_list);

		return "lhj/ec_list";
	}

}
