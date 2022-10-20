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
import com.myspring.syl.lhj.dto.InbodyDTO;
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
		// �������� ī��Ʈ�� �ٲ㼭 int�� �޾ƿ��� ������ ���� �� ���� ���߿� ����
		
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
	
	// ��������������� �ι�° ������ ����������������
	
	
//	public String test() {
		
//		return 
//	}

	@Override
	@RequestMapping(value = "/inbody/ec_list.do", method = RequestMethod.GET)
	public String select_Inbody_Last(Model model) {
		logger.info("���� ��Ʈ�ѷ� select_Inbody �޼ҵ� ���� ����");
		
		List<ExerciseDTO> select_Inbody_Last = exerciseservice.select_Inbody_Last();
		model.addAttribute("select_Inbody_Last", select_Inbody_Last);
		select_One_Inbody_2(model);
		return "lhj/ec_Inbody";
	}
	
	@Override
	@RequestMapping(value = "/inbody/update.do", method = RequestMethod.POST)
	public String insert_Inbody(Model model,
								@RequestParam("inBody_Height") int inBody_Height,
								@RequestParam("inBody_Weight") int inBody_Weight,
								@RequestParam("inBody_Body_Fat") int inBody_Body_Fat,
								@RequestParam("inBody_Skeletal") int inBody_Skeletal) {
		
		logger.info("���� ��Ʈ�ѷ� insert_Inbody �޼ҵ� ���� ����");
		
//		System.out.println("get name : " + inBody_Height + " " + inBody_Weight + " " + inBody_Body_Fat + " " + inBody_Skeletal);
		InbodyDTO inbodyDTO = new InbodyDTO();
		inbodyDTO.setInBody_Height(inBody_Height);
		inbodyDTO.setInBody_Weight(inBody_Weight);
		inbodyDTO.setInBody_Body_Fat(inBody_Body_Fat);
		inbodyDTO.setInBody_Skeletal(inBody_Skeletal);
		
		exerciseservice.insert_Inbody(inbodyDTO);
		
		select_Inbody_Last(model);
		return "lhj/ec_Inbody";
	}
	
	
	
	// �Ŀ� ������ư Ȯ�� Ȱ��ȭ ��Ű�°� �����ϸ� �� ���ε� ���� �ְ���..
	@Override
	@RequestMapping(value = "/inbody/onelist.do", method = RequestMethod.POST)
	public String select_One_Inbody_2(Model model) {
		
		InbodyDTO select_One_Inbody_2 = exerciseservice.select_One_Inbody_2();
		model.addAttribute("select_One_Inbody_2", select_One_Inbody_2);
		
		return "lhj/ec_Inbody";
	}
	
	
}
