package com.myspring.syl.sdy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.syl.sdy.dao.NoticeDAO;
import com.myspring.syl.sdy.dto.AskDTO;
import com.myspring.syl.sdy.dto.NoticeDTO;



@Service
public class NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	
//	public Map getNoticeList(int pageNum, int countPerPage) {
//		int start=0, end=0;
//		start = ((pageNum-1) * countPerPage) + 1;
//		end = pageNum * countPerPage;
//		end = start + countPerPage - 1;
//		
//		/*
//		 * 1, 5
//		 * 		start=1, end=5
//		 * 2, 5
//		 * 		start=6, end=10
//		 * 3, 5
//		 * 		start=11, end=15
//		 */
//		
//		Map map = new HashMap();
//		map.put("start", start);
//		map.put("end", end);
//		
//		List<NoticeDTO> list = noticeDAO.selectNoticeList(map);
//		
//		int count = noticeDAO.selectNoticeCount();
//		
//		Map map1 = new HashMap();
//		map1.put("list", list);
//		map1.put("count", count);
//		
//		return map1;
//	
//	}
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
	//글검색,전체 리스트
	public Map getSearchNoticeList(int pageNum, int countPerPage,String search,String ser_name) {
		
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
		map.put("ser_name", ser_name);
		map.put("search", search);
		
		List<NoticeDTO> list = noticeDAO.searchNoticeList(map);
		
			int count = noticeDAO.selectNoticeCount(map);
			
			Map map1 = new HashMap();
			map1.put("list", list);
			map1.put("count", count);
			
		return map1;
		
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
