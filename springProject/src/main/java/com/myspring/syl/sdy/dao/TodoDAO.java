package com.myspring.syl.sdy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.syl.sdy.dto.TodoDTO;


@Repository
public class TodoDAO {
	
		@Autowired
		SqlSession sqlSession;
		//모든 리스트
		public List<TodoDTO> selectTodoList() {
			List<TodoDTO> list =sqlSession.selectList("mapper.sdy.selectAllTodoList");
			return list;
		}
		//시퀀스
		public int todoSeq() {
			int todo_id =sqlSession.selectOne("mapper.sdy.todoSeq");
			return todo_id;
		}
		//글 등록
		public void insertTOdoContents(TodoDTO todoDTO) {
			sqlSession.insert("mapper.sdy.insertTodoContents",todoDTO);
		}
		
		//체크 선택시 삭제
		public void delTodoList(List todo_id) {
			System.out.println("del 다오진입");
			sqlSession.delete("mapper.sdy.deleteChkTodo",todo_id);		
			}
		//개별체크수정
		public void modTodoChk(TodoDTO todoDTO) {
			sqlSession.update("mapper.sdy.updateTodoChk", todoDTO);
		}
		//전체 체크 수정
		public void modTodoAllChk(Map map) {
			sqlSession.update("mapper.sdy.updateTodoAllChk", map);
		}
	
	
}
