package com.myspring.syl.lhj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.syl.lhj.dto.ExerciseDTO;

@Repository
public class ExerciseDAOImpl implements ExerciseDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ExerciseDTO> selectAllList() {
		List<ExerciseDTO> exercise_List = sqlSession.selectList("mapper.lhj.selectAllList");
		return exercise_List;
	}

}
