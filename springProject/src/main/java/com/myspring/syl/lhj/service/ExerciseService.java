package com.myspring.syl.lhj.service;

import java.util.List;

import com.myspring.syl.lhj.dto.ExerciseDTO;
import com.myspring.syl.lhj.dto.InbodyDTO;

public interface ExerciseService {

	public List<ExerciseDTO> selectAllList();
	
	public List<ExerciseDTO> selectList();
	
	public int ec_insert(ExerciseDTO exerciseDTO);
	
	public int ec_delete(int[] seq_Exercise);
	
	public int ec_update(ExerciseDTO exerciseDTO);
	
	public List<ExerciseDTO> saying();
	
	public String sayingAry(int sayingAry);
	
	// �ι�° ������
	
	public List<InbodyDTO> select_Inbody_Last();
	
	public int insert_Inbody(InbodyDTO inbodyDTO);
	
	public InbodyDTO select_One_Inbody_2();
	
	public List<InbodyDTO> select_Inbody_list();
	
	public int update_Inbody2(InbodyDTO inbodyDTO);
	
	public int delete_Inbody(int[] seq_delete);
}
