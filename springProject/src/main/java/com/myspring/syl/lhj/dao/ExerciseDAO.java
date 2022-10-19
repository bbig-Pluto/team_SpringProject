package com.myspring.syl.lhj.dao;

import java.util.List;

import com.myspring.syl.lhj.dto.ExerciseDTO;

public interface ExerciseDAO {

	public List<ExerciseDTO> selectAllList();
	
	public int ec_insert(ExerciseDTO exerciseDTO);
	
	public int ec_delete(int[] seq_Exercise);
	
	public int ec_update(ExerciseDTO exerciseDTO);
	
	public List<ExerciseDTO> saying();
	
	public String sayingAry(int sayingAry);
}
