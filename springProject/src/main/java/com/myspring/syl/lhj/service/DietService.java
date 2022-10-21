package com.myspring.syl.lhj.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.syl.lhj.controller.ExerciseControllerImpl;
import com.myspring.syl.lhj.dao.DietDAO;
import com.myspring.syl.lhj.dto.DietDTO;

@Service
public class DietService {
	
	private static final Logger logger = LoggerFactory.getLogger(ExerciseControllerImpl.class);
	
	@Autowired
	DietDAO dietDAO;
	
	public int seq() {
		int seq = dietDAO.seq();
		logger.info("����ȣ�� seq : " + seq);
		return seq;
	};
	
	public List<DietDTO> diet_menu_list(){
		List<DietDTO> diet_menu_list = dietDAO.diet_menu_list();
		return diet_menu_list;
	}
	
	public int diet_insert(DietDTO dietDTO) {
		logger.info(" ����ȣ�� diet_insert : " + dietDTO.getSeq_diet_diary());
		int diet_insert = dietDAO.diet_insert(dietDTO);

		return diet_insert;
	}
	
	public int diet_insert_menu(DietDTO dietDTO) {
		logger.info(" ���� diet_insert_menu ����" + dietDTO.getSeq_diet_diary());
		dietDTO.setSeq_diet_diary(seq());
		int diet_insert_menu = dietDAO.diet_insert_menu(dietDTO);
		
		return diet_insert_menu;
		
	}
	
	public DietDTO diet_list_Last() {
		logger.info(" ���� diet_list_Last ����");
		DietDTO diet_list_Last = dietDAO.diet_list_Last();
		
		return diet_list_Last;
	}
	
	public int diet_menu_update(DietDTO dietDTO) {
		logger.info(" ���� diet_menu_update ����");
		
		dietDTO.setSeq_diet_diary(seq());
		int diet_menu_update = dietDAO.diet_menu_update(dietDTO);
		return diet_menu_update;
	}
	
	public int diet_menu_delete(int delete) {
		logger.info(" ���� diet_menu_delete ����");
		
		int diet_menu_delete = dietDAO.diet_menu_delete(delete);
		return diet_menu_delete;
	}
}
