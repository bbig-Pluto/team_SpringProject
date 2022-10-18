package com.myspring.syl.lhj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

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

	@Override
	public int ec_insert(ExerciseDTO exerciseDTO) {
//		int ec_insert = sqlSession.selectOne("mapper.lhj.ec_insert" ,exerciseDTO);
		Integer ec_insert = sqlSession.insert("mapper.lhj.ec_insert" ,exerciseDTO);
		System.out.println("DAO ���� ec_insert " + ec_insert);
		return ec_insert;
	}

	@Override
	public int ec_delete(int[] seq_Exercise) {
		int ec_delete = sqlSession.delete("mapper.lhj.ec_delete", seq_Exercise);
//		System.out.println("DAO ���� ec_delete + " + ec_delete);
		return ec_delete;
	}
}
