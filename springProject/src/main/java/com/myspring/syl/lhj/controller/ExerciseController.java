package com.myspring.syl.lhj.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.syl.lhj.dto.ExerciseDTO;

public interface ExerciseController {
	
	public String selectAllList(Model model);
	
	public void selectList(Model model);
	
	public String inbody_delete(Model model, int[] seq_record);
	
	public String add(String exercise_Contents, String exercise_Time, Model model) ;

	public String del(int[] seq_Exercise, Model model);

	public String update(int[] seq_Exercise, String[] exercise_Contents, String[] exercise_Time, Model model);
	
	public void saying(Model model);
	
	public String sayingAry();
	
	public void Inbody_List(Model model);
	
	public String select_Inbody_Last(Model model);
	
	public String insert_Inbody(Model model,
			int InBody_Height,
			int InBody_Weight,
			int InBody_Body_Fat,
			int InBody_Skeletal
			);
	
	public void select_One_Inbody_2(Model model);
	
	public String update_Inbody2(Model model,
			int seq_Inbody_2,
			int inBody_Height_2,
			int inBody_Weight_2,
			int inBody_Body_Fat_2,
			int inBody_Skeletal_2);
	
	public void select_Inbody_list(Model model);
	
	public String delete_Inbody(Model model, int[] seq_Inbody);
}
