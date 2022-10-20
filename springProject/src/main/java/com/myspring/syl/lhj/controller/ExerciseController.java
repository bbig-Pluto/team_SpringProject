package com.myspring.syl.lhj.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.syl.lhj.dto.ExerciseDTO;

public interface ExerciseController {
	
	public String selectAllList(Model model);
	
	public String add(String exercise_Contents, String exercise_Time, Model model) ;

	public String del(int[] seq_Exercise, Model model);

	public String update(int[] seq_Exercise, String[] exercise_Contents, String[] exercise_Time, Model model);
	
	public void saying(Model model);
	
	public String sayingAry();
	
	// 두번째 페이지
	
	public String select_Inbody_Last(Model model);
	
	public String insert_Inbody(Model model,
			int InBody_Height,
			int InBody_Weight,
			int InBody_Body_Fat,
			int InBody_Skeletal
			);
	
	
	public String select_One_Inbody_2(Model model);
	
}
