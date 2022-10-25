package com.myspring.syl.yyk.dao;

import java.util.List;
import java.util.Map;

public interface MemoDAO {

	String memoList(String sessionId);
	int addMemo(Map map);
	int updateMemo(Map map);
}
