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

	
	@Override
	public void saying(Model model) {
		logger.info(" 컨트롤러 : saying 메소드 실행 ");
		// 후에 이 list를 사용해서 sayingAry의 size를 잡을 예정
		List<ExerciseDTO> saying = exerciseservice.saying();
		model.addAttribute("saying", saying);
	}
	
	/**
	 * 명언 내용을 랜덤으로 보여줌
	 * 
	 * @return 명언 내용
	 */
	@Override
	public String sayingAry() {
		logger.info(" 컨트롤러 : sayingAry 메소드 실행 ");
		
		Random random = new Random();
		int n = random.nextInt(10)+1; 
//		System.out.println(" randomint :"+ n);
		String sayingAry = exerciseservice.sayingAry(n);

		return sayingAry;
	}

	/**
	 * 1page 운동기록 전체 list seq 정렬
	 * 
	 * @param model
	 */
	@Override
	public void selectList(Model model) {
		logger.info("컨트롤러 : selectList 메소드 실행");
		
		List<ExerciseDTO> selectList = exerciseservice.selectList();
		model.addAttribute("selectList",selectList);
	}

	/**
	 * 1page 최근 일주일 값 출력 메소드
	 * 7개의 list만 보임 (sql 제한)
	 * 
	 * @param model
	 * @return 1page 운동 기록 7개 list 메소드
	 */
	@Override
	@RequestMapping(value = "/ec_list.do", method = RequestMethod.GET)
	public String selectAllList(Model model) {
		logger.info("컨트롤러 : selectAllList 메소드 실행");

		List<ExerciseDTO> exercise_list = exerciseservice.selectAllList();
		model.addAttribute("exercise_list", exercise_list);
		
		model.addAttribute("ment", sayingAry());
		
		selectList(model); // 운동 기록 전체 list 메소드
		return "lhj/ec_list";
	}

	/*
	 * 1page 운동 기록 삭제
	 */
	@Override
	@RequestMapping(value = "/record/delete.do", method = RequestMethod.POST)
	public String inbody_delete(Model model,
								@RequestParam("seq_Exercise") int[] seq_Exercise
								) {
		logger.info("���� ��Ʈ�ѷ� del �޼ҵ� ���� ����");
		for(int i=0; i<seq_Exercise.length; i++) {
			System.out.println(" seq_record 확인" + seq_Exercise[i]);
		}
		int ec_delete = exerciseservice.ec_delete(seq_Exercise);
		System.out.println(" 성공여부 1이 나오면 성공 : " + ec_delete);
		
		selectAllList(model); // 첫 페이지 메소드 (list 출력)
		return "lhj/ec_list";
	}

	/**
	 * 1page 운동 추가
	 * 
	 */
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
		return "redirect:/ec_list.do";
	}

	/**
	 * 1page 운동 삭제
	 */
	@Override
	@RequestMapping(value = "/exercise/ec_del.do", method = RequestMethod.POST)
	public String del(@RequestParam("seq_Exercise") int[] seq_Exercise, Model model) {
		logger.info("���� ��Ʈ�ѷ� del �޼ҵ� ���� ����");

		for (int i = 0; i < seq_Exercise.length; i++) {
			System.out.println("seq_Exercise : " + seq_Exercise[i]);
		};

		exerciseservice.ec_delete(seq_Exercise);

		return "redirect:/ec_list.do";
	}

	/**
	 * 1page 운동 업데이트
	 */
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
	
	/**
	 * 2page 현재체중량 테이블 마지막 값 호출 메소드
	 * (sql 제한) 메소드 호출해서 사용
	 * 
	 * @param model
	 */
	@Override
	public void Inbody_List(Model model) {
		logger.info(" 컨트롤러 : Inbody_List 메소드 실행 ");
		
		List<InbodyDTO> select_Inbody_Last = exerciseservice.select_Inbody_Last();
		model.addAttribute("select_Inbody_Last", select_Inbody_Last);
	}
	
	/**
	 * 2page 목표체중량 테이블 list 호출 메소드
	 * 입력 하나만 함
	 * 
	 * @param model
	 */
	@Override
	public void select_One_Inbody_2(Model model) {
		InbodyDTO select_One_Inbody_2 = exerciseservice.select_One_Inbody_2();
		model.addAttribute("select_One_Inbody_2", select_One_Inbody_2);
	}

	/**
	 * 2page 현재체중량 전체 list 호출 메소드
	 * 
	 * @param model
	 */
	@Override
	public void select_Inbody_list(Model model) {
		
		List<InbodyDTO> select_Inbody_list = exerciseservice.select_Inbody_list();
		model.addAttribute("select_Inbody_list", select_Inbody_list);
	}

	/**
	 * 2page 운동 마지막 값 조회
	 */
	@Override
	@RequestMapping(value = "/inbody/ec_list.do", method = RequestMethod.GET)
	public String select_Inbody_Last(Model model) {
		logger.info("���� ��Ʈ�ѷ� select_Inbody �޼ҵ� ���� ����");
		
		List<InbodyDTO> select_Inbody_Last = exerciseservice.select_Inbody_Last();
		model.addAttribute("select_Inbody_Last", select_Inbody_Last);
		
		select_One_Inbody_2(model); // ��ǥü�߷� ���̺�
		select_Inbody_list(model); // ���� ������� ���̺�
		model.addAttribute("ment", sayingAry()); // 명언테이블
		return "lhj/ec_Inbody";
	}
	
	// 2page 현재체중량 추가
	@Override
	@RequestMapping(value = "/inbody/insert.do", method = RequestMethod.POST)
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
		
//		select_Inbody_Last(model);
//		sayingAry(); // 명언테이블
//		return "lhj/ec_Inbody";
		return "redirect:/inbody/ec_list.do";
	}

	/**
	 * 2page 목표체중량 업데이트
	 */
	@Override
	@RequestMapping(value = "/inbody/update.do", method = RequestMethod.POST)
	public String update_Inbody2(Model model,
									  @RequestParam("seq_Inbody_2") int seq_Inbody_2,
									  @RequestParam("inbody_Height_2") int inbody_Height_2,
									  @RequestParam("inbody_Weight_2") int inbody_Weight_2,
									  @RequestParam("inbody_Body_Fat_2") int inbody_Body_Fat_2,
									  @RequestParam("inbody_Skeletal_2") int inbody_Skeletal_2) {
		
		System.out.println("get name : " + seq_Inbody_2 + ' ' + inbody_Height_2 + ' ' + inbody_Weight_2 + ' ' + inbody_Body_Fat_2 + ' ' + inbody_Skeletal_2);
		
		InbodyDTO inbodyDTO = new InbodyDTO(seq_Inbody_2, inbody_Height_2, inbody_Weight_2, inbody_Body_Fat_2, inbody_Skeletal_2);

		System.out.println("dto set name : " + inbodyDTO.getSeq_Inbody_2());
		
		int update_Inbody2 = exerciseservice.update_Inbody2(inbodyDTO);
		System.out.println(" ��Ʈ�ѷ� update_Inbody2 ���� " + update_Inbody2);
		
		Inbody_List(model); // ���� ü�߷� ���̺�
		select_One_Inbody_2(model); // ��ǥ ü�߷� ���̺�
		select_Inbody_list(model); // ���� ������� ���̺�
		model.addAttribute("ment", sayingAry()); // 명언테이블
		return "lhj/ec_Inbody";
	}

	/*
	 * 나의 기록일지(현재 체중량)삭제 메소드
	 */
	@Override
	@RequestMapping(value = "/inbody/delete.do", method = RequestMethod.POST)
	public String delete_Inbody(Model model,
								@RequestParam("seq_Inbody") int[] seq_Inbody) {
		logger.info("■■■ 컨트롤러 delecte 메소드 실행 ■■■");
		for (int i = 0; i < seq_Inbody.length; i++) {
			System.out.println("get name : " + seq_Inbody[i]);
		};
		
		int delete_Inbody = exerciseservice.delete_Inbody(seq_Inbody);
		System.out.println("delete_Inbody 1이 나오면 성공" + delete_Inbody);
		
		Inbody_List(model); // ���� ü�߷� ���̺�
		select_One_Inbody_2(model); // ��ǥ ü�߷� ���̺�
		select_Inbody_list(model); // ���� ������� ���̺�
		model.addAttribute("ment", sayingAry()); // 명언테이블
		return "lhj/ec_Inbody";
	}


}
