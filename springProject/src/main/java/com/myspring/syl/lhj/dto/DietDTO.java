package com.myspring.syl.lhj.dto;

import java.sql.Date;

public class DietDTO {

	//	�Ĵ����� Diet_diary ���̺� ���� 
	private int seq_diet_diary; //PK
	

	private String session_user_id_hj;	// ���� ���������� ���� �ʵ�
	
	
	private Date diet_diary_today;
	private String diet_diary_type;
	
	public DietDTO() {
	}
	
	// ����� A
	public DietDTO(String diet_diary_type, String session_user_id_hj) {
		this.diet_diary_type = diet_diary_type;
		this.session_user_id_hj = session_user_id_hj;
	}
	
	
//	�Ĵ����� ����ȭ Diet_diary_Menu ���̺� ����
	private int seq_diet_diary_menu; //FK
	private String diet_diary_menu;
	private int diet_diary_menu_calorie;
	private int diet_diary_menu_sum;


//	// ���� ������ DTO
//	public Diet_diary_DTO(int seq_diet_diary_menu, String diet_diary_menu, int diet_diary_menu_calorie, int diet_diary_menu_sum) {
//		this.seq_diet_diary_menu = seq_diet_diary_menu;
//		this.diet_diary_menu = diet_diary_menu;
//		this.diet_diary_menu_calorie = diet_diary_menu_calorie;
//		this.diet_diary_menu_sum = diet_diary_menu_sum;
//	}
	
	// ����� A
	public DietDTO(String diet_diary_menu, int diet_diary_menu_calorie, int diet_diary_menu_sum) {
		this.diet_diary_menu = diet_diary_menu;
		this.diet_diary_menu_calorie = diet_diary_menu_calorie;
		this.diet_diary_menu_sum = diet_diary_menu_sum;
	}
	
	// �����
	public DietDTO(int diet_diary_menu_sum, int diet_diary_menu_calorie, String diet_diary_menu ) {
		this.diet_diary_menu = diet_diary_menu;
		this.diet_diary_menu_calorie = diet_diary_menu_calorie;
		this.diet_diary_menu_sum = diet_diary_menu_sum;
	}
	
//	�Ĵ����� Diet_diary ���̺� get set���� 
	public int getSeq_diet_diary() {
		return seq_diet_diary;
	}

	public void setSeq_diet_diary(int seq_diet_diary) {
		this.seq_diet_diary = seq_diet_diary;
	}

	public String getSession_user_id_hj() {
		return session_user_id_hj;
	}

	public void setSession_user_id_hj(String session_user_id_hj) {
		this.session_user_id_hj = session_user_id_hj;
	}

	public Date getDiet_diary_today() {
		return diet_diary_today;
	}

	public void setDiet_diary_today(Date diet_diary_today) {
		this.diet_diary_today = diet_diary_today;
	}

	public String getDiet_diary_type() {
		return diet_diary_type;
	}

	public void setDiet_diary_type(String diet_diary_type) {
		this.diet_diary_type = diet_diary_type;
	}
	
	
	
	
//	�Ĵ����� ����ȭ Diet_diary_Menu ���̺� get set ����
	public int getSeq_diet_diary_menu() {
		return seq_diet_diary_menu;
	}

	public void setSeq_diet_diary_menu(int seq_diet_diary_menu) {
		this.seq_diet_diary_menu = seq_diet_diary_menu;
	}

	public String getDiet_diary_menu() {
		return diet_diary_menu;
	}

	public void setDiet_diary_menu(String diet_diary_menu) {
		this.diet_diary_menu = diet_diary_menu;
	}

	public int getDiet_diary_menu_calorie() {
		return diet_diary_menu_calorie;
	}

	public void setDiet_diary_menu_calorie(int diet_diary_menu_calorie) {
		this.diet_diary_menu_calorie = diet_diary_menu_calorie;
	}

	public int getDiet_diary_menu_sum() {
		return diet_diary_menu_sum;
	}

	public void setDiet_diary_menu_sum(int diet_diary_menu_sum) {
		this.diet_diary_menu_sum = diet_diary_menu_sum;
	}

	
	
	
	
	
}

