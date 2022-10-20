package com.myspring.syl.sdy.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.syl.sdy.dao.AskDAO;
import com.myspring.syl.sdy.dto.AskDTO;
import com.myspring.syl.sdy.dto.ReplyDTO;




@Service
public class AskService {

	@Autowired
	AskDAO askDAO;
	//전체리스트
//	public List<AskDTO> getMemberList() {
//		return askDAO.selectMember();
//	
//	}
	public Map getPagingList(int pageNum, int countPerPage){
	
		int start=0, end=0;
		start = ((pageNum-1) * countPerPage) + 1;
		end = pageNum * countPerPage;
		end = start + countPerPage - 1;
		
		/*
		 * 1, 5
		 * 		start=1, end=5
		 * 2, 5
		 * 		start=6, end=10
		 * 3, 5
		 * 		start=11, end=15
		 */
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<AskDTO> list = askDAO.selectMember(map);
		
		int count = askDAO.selectListCount();
		
		Map map1 = new HashMap();
		map1.put("list", list);
		map1.put("count", count);
		
		return map1;
	}
	//댓글조회
	public List<ReplyDTO> getReplyList(String board_no) {
		return askDAO.selectReply(board_no);
	
	}
	//게시글 비밀번호 조회
	public String getPw(String ask_pwd) {
		try {
			return askDAO.pwCheck(ask_pwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ask_pwd;
		
	}
	//댓글 등록
	public void getInsertReply(ReplyDTO replyDTO) {
		 askDAO.insertReply(replyDTO);	
	}
	//게시글에 댓글수 표시
	public void getCountReply(String borad_no) throws Exception {
		askDAO.updateReplyCount(borad_no);
	}
	//글 등록
	public void getInsertList(AskDTO askDTO) {
		askDAO.insertContents(askDTO);	
	}
	//조회수
	@Transactional(isolation = Isolation.READ_COMMITTED)
	public AskDTO getDetailContents(String board_no) throws Exception {
		System.out.println("dtail dao진입");
				askDAO.boardHit(board_no);
				
		return askDAO.detailContents(board_no);
		
	}
	public List<AskDTO> getSearchList(HashMap<String,String> hashMap) {
		return askDAO.searchList(hashMap);
		
	}
	//글삭제
	public void getDelList(String board_no) {
		askDAO.delList(board_no);
		
	}
	//댓글삭제
	public void getDelReplyList(String re_no) {
		askDAO.delReList(re_no);
		
	}
	//글수정
	public void getModList(AskDTO askDTO){
		askDAO.modList(askDTO);
	}
	//체크시 삭제
	public void getAskDelChk(List board_no){
		askDAO.delReChk(board_no);
		askDAO.delAskChk(board_no);
	}

	
	
}
