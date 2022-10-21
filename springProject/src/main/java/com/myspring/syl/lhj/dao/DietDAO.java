package com.myspring.syl.lhj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.syl.lhj.controller.ExerciseControllerImpl;
import com.myspring.syl.lhj.dto.DietDTO;

@Repository
public class DietDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ExerciseControllerImpl.class);
	
	@Autowired
	SqlSession sqlSession;
	
	public int seq() {
		logger.info("DAO seq �޼ҵ� ����");
		int seq = sqlSession.selectOne("mapper.lhj.seq");
		System.out.println("DAO : " +  seq);
		return seq;
	};
	
	// 2page���� menu list ��ȸ
	public List<DietDTO> diet_menu_list() {
		List<DietDTO> diet_menu_list = sqlSession.selectList("mapper.lhj.diet_menu_list");
		return diet_menu_list;
	}
	
	/*
	 * Diet_diary �߰�
	 */
	public int diet_insert(DietDTO dietDTO) {
		logger.info("DAO diet_insert �޼ҵ� ����");
		
		int diet_insert = sqlSession.insert("mapper.lhj.diet_insert", dietDTO);
		return diet_insert;
	}
	
	/*
	 * Diet_diary_menu �߰�
	 */
	public int diet_insert_menu(DietDTO dietDTO) {
		logger.info("DAO diet_insert_menu �޼ҵ� ����");
		
		int diet_insert_menu = sqlSession.insert("mapper.lhj.diet_insert_menu", dietDTO);
		return diet_insert_menu;
	}
	
	
	public DietDTO diet_list_Last() {
		logger.info("DAO diet_list_Last �޼ҵ� ����");
		
		DietDTO diet_list_Last = sqlSession.selectOne("mapper.lhj.diet_list_Last");
		return 	diet_list_Last;
	}
	
	
	// ���
	public int diet_menu_update(DietDTO dietDTO) {
		int diet_menu_update = sqlSession.update("mapper.lhj.diet_menu_update", dietDTO);
		return diet_menu_update;
	}
	
	public int diet_menu_delete(int delete) {
		int diet_menu_delete = sqlSession.delete("mapper.lhj.diet_menu_delete", delete);
		return diet_menu_delete;
	}
}
