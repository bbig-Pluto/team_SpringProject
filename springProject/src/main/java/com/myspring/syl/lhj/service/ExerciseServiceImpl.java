package com.myspring.syl.lhj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.syl.lhj.dao.ExerciseDAO;
import com.myspring.syl.lhj.dto.ExerciseDTO;

@Service
public class ExerciseServiceImpl implements ExerciseService{

	@Autowired
	ExerciseDAO exerciseDAO;
	
	@Override
	public List<ExerciseDTO> selectAllList() {
		List<ExerciseDTO> exercise_List = exerciseDAO.selectAllList();
		return exercise_List;
	}

	@Override
	public int ec_insert(ExerciseDTO exerciseDTO) {
		int ec_insert = exerciseDAO.ec_insert(exerciseDTO);
		return ec_insert;
	}

	@Override
	public int ec_delete(int[] seq_Exercise) {
		int ec_delete = exerciseDAO.ec_delete(seq_Exercise);
		return ec_delete;
	}

	@Override
	public int ec_update(ExerciseDTO exerciseDTO) {
		int ec_update = exerciseDAO.ec_update(exerciseDTO);
		return ec_update;
	}

	@Override
	public List<ExerciseDTO> saying() {
		List<ExerciseDTO> saying = exerciseDAO.saying();
		return saying;
	}

	@Override
	public String sayingAry(int ary) {
		String sayingAry = exerciseDAO.sayingAry(ary);
		return sayingAry;
	}

	// 두번째 페이지
}
