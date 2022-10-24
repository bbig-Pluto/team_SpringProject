package com.myspring.syl.sdy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.syl.sdy.dao.TodoDAO;
import com.myspring.syl.sdy.dto.TodoDTO;


@Service
public class TodoService {
	@Autowired
	TodoDAO todoDAO;
	//전체 리스트
	public List<TodoDTO> getTodoList() {
		return todoDAO.selectTodoList();
	}
	//체크시 삭제
	public void getTodoDelChk(List todo_id){
		System.out.println("del 서비스 진입");
		todoDAO.delTodoList(todo_id);
	}
	//글 등록
	public int getTodoInsertList(TodoDTO todoDTO) {
		int todo_id = todoDAO.todoSeq();
		todoDTO.setTodo_id(todo_id);
		todoDAO.insertTOdoContents(todoDTO);
		return todo_id;
	}
	//글수정
	public void getModTodoChk(TodoDTO todoDTO){
		todoDAO.modTodoChk(todoDTO);
	}
}
