package com.myspring.syl.yyk.service;

import java.util.List;
import java.util.Map;

public interface MemoService {

	String getMemoList(String sessionId);
	int getAddMemo(Map map);
	int getUpdateMemo(Map map);
}
