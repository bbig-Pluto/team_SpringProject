package com.myspring.syl.sdy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.syl.sdy.dao.NoticeDAO;
import com.myspring.syl.sdy.dto.NoticeDTO;



@Service
public class NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	
	public List<NoticeDTO> getNoticeList() {
		return noticeDAO.selectNoticeList();
	
	}
	//글 등록
	public void getNoticeInsertList(NoticeDTO noticeDTO) {
		noticeDAO.insertNoticeContents(noticeDTO);	
	}
	@Transactional(isolation = Isolation.READ_COMMITTED)
	public NoticeDTO getDetailContents(String board_no) {
			try {
				noticeDAO.boardNoticeHit(board_no);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return noticeDAO.NoticeDtailList(board_no);
		
	}
	public List<NoticeDTO> getSearchNoticeList(String title) {
		return noticeDAO.searchNoticeList(title);
		
	}
	//글삭제
		public void getNoticeDelList(String board_no) {
			noticeDAO.delNoticeList(board_no);
			
		}
	//글수정
	public void getNoticeModList(NoticeDTO noticeDTO){
		noticeDAO.modNoticeList(noticeDTO);
	}
	//체크시 삭제
		public void getNoticeDelChk(List board_no){
			noticeDAO.delNoticeChk(board_no);
		}

	
	
}
