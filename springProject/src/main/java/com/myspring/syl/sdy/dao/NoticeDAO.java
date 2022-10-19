package com.myspring.syl.sdy.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.syl.sdy.dto.NoticeDTO;


@Repository
public class NoticeDAO {
	
	@Autowired
	SqlSession sqlSession;	
	//모든 리스트
	public List<NoticeDTO> selectNoticeList() {
		List<NoticeDTO> list =sqlSession.selectList("mapper.sdy.selectNoticeList");
		return list;
	}
	//조회수
	public void boardNoticeHit(String board_no) throws Exception {
		System.out.println("hit dao진입");
		sqlSession.update("mapper.sdy.boardNoticeHit", board_no);
	}
	//상세페이지
	public NoticeDTO NoticeDtailList(String board_no) {
		NoticeDTO noticeDTO =sqlSession.selectOne("mapper.sdy.detailNoticeContents",board_no);
		return noticeDTO;
	}
	//검색
	public List<NoticeDTO> searchNoticeList(String title) {
		List<NoticeDTO> list =sqlSession.selectList("mapper.sdy.serchNoticeList",title);
		return list;
	}
	//글 등록
	public void insertNoticeContents(NoticeDTO noticeDTO) {
		sqlSession.insert("mapper.sdy.insertNoticeContents",noticeDTO);
	}
	//글삭제
		public void delNoticeList(String board_no) {
			sqlSession.delete("mapper.sdy.deleteNoticeMember", board_no);
		}
	//글수정
		public void modNoticeList(NoticeDTO noticeDTO) {
			sqlSession.update("mapper.sdy.updateNoticeContent", noticeDTO);
		}
	//체크 선택시 삭제
		public void delNoticeChk(List board_no) {
			sqlSession.insert("mapper.sdy.deleteNoticeChk",board_no);		
		}
}
