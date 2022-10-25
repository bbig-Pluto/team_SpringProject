package com.myspring.syl.yyk.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.syl.yyk.dao.MemoDAO;

@Service
public class MemoServiceImpl implements MemoService {

	@Autowired
	MemoDAO memoDAO;

	@Override
	public int getAddMemo(Map map) {
		int result = memoDAO.addMemo(map);
		return result;
	}
	
	@Override
	public int getUpdateMemo(Map map) {
		int result = memoDAO.updateMemo(map);
		return result;
	}

	@Override
	public String getMemoList(String sessionId) {
		String result = memoDAO.memoList(sessionId);
		return result;
	}
	
	
	
}
