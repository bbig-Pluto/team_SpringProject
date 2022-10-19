package com.myspring.syl.lhj.controller;

import java.util.List;
import java.util.Random;

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

	// ���� ���� �޼ҵ�
	@Override
	public void saying(Model model) {
		logger.info("���� ��Ʈ�ѷ� saying �޼ҵ� ���� ����");

		List<ExerciseDTO> saying = exerciseservice.saying();
		model.addAttribute("saying", saying);
	}
	
	// ���� ���� �޼ҵ�
	@Override
	public String sayingAry() {
		logger.info("���� ��Ʈ�ѷ� test sayingAry �޼ҵ� ���� ����");
//		List<ExerciseDTO> saying = exerciseservice.saying();
//		int randomint = (int)Math.random()*10;
		
		Random random = new Random();
		int n = random.nextInt(10)+1; 
		System.out.println(" randomint :"+ n);
		String sayingAry = exerciseservice.sayingAry(n);

		return sayingAry;
	}

	@Override
	@RequestMapping(value = "/ec_list.do", method = RequestMethod.GET)
	public String selectAllList(Model model) {
		logger.info("���� ��Ʈ�ѷ� list �޼ҵ� ���� ����");

		List<ExerciseDTO> exercise_list = exerciseservice.selectAllList();
		model.addAttribute("exercise_list", exercise_list);
		
		model.addAttribute("ment", sayingAry());
		return "lhj/ec_list";
	}

	@Override
	@RequestMapping(value = "/exercise/ec_add.do", method = RequestMethod.POST)
	public String add(@RequestParam("exercise_Contents") String exercise_Contents,
			@RequestParam("exercise_Time") String exercise_Time, Model model) {
		logger.info("���� ��Ʈ�ѷ� add �޼ҵ� ���� ����");
		System.out.println("exercise_Contents " + exercise_Contents);
		System.out.println("exercise_Time " + exercise_Time);
		ExerciseDTO dto = new ExerciseDTO();
		dto.setExercise_Contents(exercise_Contents);
		dto.setExercise_Time(exercise_Time);

		exerciseservice.ec_insert(dto);
		selectAllList(model); // ����Ʈ�� �ִ� �޼ҵ�
		return "lhj/ec_list";
	}

	@Override
	@RequestMapping(value = "/exercise/ec_del.do", method = RequestMethod.POST)
	public String del(@RequestParam("seq_Exercise") int[] seq_Exercise, Model model) {
		logger.info("���� ��Ʈ�ѷ� del �޼ҵ� ���� ����");

		for (int i = 0; i < seq_Exercise.length; i++) {
			System.out.println("seq_Exercise : " + seq_Exercise[i]);
		};

		exerciseservice.ec_delete(seq_Exercise);
		selectAllList(model); // ����Ʈ�� �ִ� �޼ҵ�

		return "lhj/ec_list";
	}

	@Override
	@RequestMapping(value = "/exercise/ec_update.do", method = RequestMethod.POST)
	public String update(@RequestParam("seq_Exercise") int[] seq_Exercise,
			@RequestParam("exercise_Contents") String[] exercise_Contents,
			@RequestParam("exercise_Time") String[] exercise_Time, Model model) {
		logger.info("���� ��Ʈ�ѷ� update �޼ҵ� ���� ����");
		for (int i = 0; i < seq_Exercise.length; i++) {
			ExerciseDTO exerciseDTO = new ExerciseDTO(seq_Exercise[i], exercise_Contents[i], exercise_Time[i]);
			System.out.println("get name : " + seq_Exercise[i] + " " + exercise_Contents[i] + " " + exercise_Time[i]);
			exerciseservice.ec_update(exerciseDTO);
		};

		selectAllList(model); // ����Ʈ�� �ִ� �޼ҵ�
		return "lhj/ec_list";
	}


}
