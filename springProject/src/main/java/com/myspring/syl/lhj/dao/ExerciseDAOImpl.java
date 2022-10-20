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
		Integer ec_insert = sqlSession.insert("mapper.lhj.ec_insert" ,exerciseDTO);
		System.out.println("DAO 실행 ec_insert " + ec_insert);
		return ec_insert;
	}

	@Override
	public int ec_delete(int[] seq_Exercise) {
		int ec_delete = sqlSession.delete("mapper.lhj.ec_delete", seq_Exercise);
		return ec_delete;
	}

	@Override
	public int ec_update(ExerciseDTO exerciseDTO) {
		int ec_update = sqlSession.update("mapper.lhj.ec_update", exerciseDTO);
		return ec_update;
	}

	@Override
	public List<ExerciseDTO> saying() {
		List<ExerciseDTO> saying = sqlSession.selectList("mapper.lhj.saying");
		return saying;
	}

	@Override
	public String sayingAry(int ary) {
		String sayingAry = sqlSession.selectOne("mapper.lhj.sayingAry", ary);
		return sayingAry;
	}
	
	// 두번째 페이지
}
