package com.myspring.syl.yyk.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemoDAOImpl implements MemoDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public String memoList(String sessionId) {
		
		String idChecking = idCheck(sessionId);
		System.out.println("idChecking result : " + idChecking);
		
		if(idChecking.equals("0")) {
			return "add";
		} else {
			String memoContent = sqlSession.selectOne("mapper.yyk.memoList", sessionId);
			return memoContent;
		}
		
	}

	private String idCheck(String sessionId) {
		String result = sqlSession.selectOne("mapper.yyk.idCheck", sessionId);
		return result;
	}
	
	@Override
	public int addMemo(Map map) {
		 int result = sqlSession.insert("mapper.yyk.addMemo", map);
		return result;
	}
	
	@Override
	public int updateMemo(Map map) {
		 int result = sqlSession.update("mapper.yyk.updateMemo", map);
		return result;
	}


}
