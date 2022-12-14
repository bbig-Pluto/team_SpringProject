package com.myspring.syl.lhj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.syl.lhj.dto.ExerciseDTO;
import com.myspring.syl.lhj.dto.InbodyDTO;

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
	public List<ExerciseDTO> selectList() {
		List<ExerciseDTO> selectList = sqlSession.selectList("mapper.lhj.selectList");
		return selectList;
	}
	
	@Override
	public int ec_insert(ExerciseDTO exerciseDTO) {
		Integer ec_insert = sqlSession.insert("mapper.lhj.ec_insert" ,exerciseDTO);
		System.out.println("DAO ���� ec_insert " + ec_insert);
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

//	��������������� 2��° ������ ���������������
	
	@Override
	public List<InbodyDTO> select_Inbody_Last() {
		List<InbodyDTO> select_Inbody_Last = sqlSession.selectList("mapper.lhj.select_Inbody_Last");
		return select_Inbody_Last;
	}

	@Override
	public int insert_Inbody(InbodyDTO inbodyDTO) {
		int insert_Inbody = sqlSession.insert("mapper.lhj.insert_Inbody", inbodyDTO);
		return insert_Inbody;
	}
	
	@Override
	public InbodyDTO select_One_Inbody_2() {
		InbodyDTO select_One_Inbody_2 = sqlSession.selectOne("mapper.lhj.select_One_Inbody_2");
		return select_One_Inbody_2;
	}
	// �ι�° ������

	@Override
	public List<InbodyDTO> select_Inbody_list() {
		List<InbodyDTO> select_Inbody_list = sqlSession.selectList("mapper.lhj.select_Inbody_list");
		return select_Inbody_list;
	}

	@Override
	public int update_Inbody2(InbodyDTO inbodyDTO) {
		int update_Inbody2 = sqlSession.update("mapper.lhj.update_Inbody2", inbodyDTO);
		return update_Inbody2;
	}

	@Override
	public int delete_Inbody(int[] seq_delete) {
		int delete_Inbody = sqlSession.delete("mapper.lhj.delete_Inbody", seq_delete);
		return delete_Inbody;
	}

}
