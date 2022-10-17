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

}