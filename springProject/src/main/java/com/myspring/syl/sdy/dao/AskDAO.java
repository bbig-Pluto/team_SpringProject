package com.myspring.syl.sdy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.syl.sdy.dto.AskDTO;
import com.myspring.syl.sdy.dto.ReplyDTO;



@Repository
public class AskDAO {
	
	@Autowired
	SqlSession sqlSession;
//	//리스트 출력
//	public List<AskDTO> selectMember(Map Map) {
//		List<AskDTO> list =sqlSession.selectList("mapper.sdy.selectAllMemberList",Map);
//		return list;
//	}
	//전체,검색 글 개수
	public int selectListCount(Map map) {
		int result =sqlSession.selectOne("mapper.sdy.getAllPageList",map);
		return result;
	}
	//검색,리스트 출력
	public List<AskDTO> searchList(Map map) {
		List<AskDTO> list =sqlSession.selectList("mapper.sdy.serchList",map);
		return list;
	}
	//조회수
	public void boardHit(String board_no) throws Exception {
		System.out.println("hit dao진입");
		sqlSession.update("mapper.sdy.boardHit", board_no);
	}
	//게시글 비밀번호 조회
	public String pwCheck(String board_no) throws Exception {
		String result=sqlSession.selectOne("mapper.sdy.AskpwCheck", board_no);
		return result;
		
	}
	//상세글보기
	public AskDTO detailContents(String board_no) {
		System.out.println("dtail dao진입");
		AskDTO askDTO =sqlSession.selectOne("mapper.sdy.detailContents",board_no);
		return askDTO;
	}
	//댓글조회
	public List<ReplyDTO> selectReply(String board_no) {
		List<ReplyDTO> list =sqlSession.selectList("mapper.sdy.readReply",board_no);
		return list;
	}
	//댓글입력
		public void insertReply(ReplyDTO replyDTO) {
			sqlSession.insert("mapper.sdy.writeReply",replyDTO);
		}
	//게시글에 댓글수 표시
	public void updateReplyCount(String board_no) throws Exception {
			sqlSession.update("mapper.sdy.updateReplyCount", board_no);
		}
	//글입력
	public void insertContents(AskDTO askDTO) {
		System.out.println("출력: "+askDTO.getAsk_classify());
		sqlSession.insert("mapper.sdy.insertContents",askDTO);
	}
	//글삭제
	public void delList(String board_no) {
		sqlSession.delete("mapper.sdy.deleteMember", board_no);
	}
	//댓글삭제
	public void delReList(String re_no) {
		sqlSession.delete("mapper.sdy.deleteReply", re_no);
	}
	//글수정
	public void modList(AskDTO askDTO) {
		sqlSession.update("mapper.sdy.updateContent", askDTO);
	}
	//댓글수정
	public void modReplyList(ReplyDTO replyDTO) {
		sqlSession.update("mapper.sdy.updateReply", replyDTO);
	}
	//체크 선택시 게시글 삭제
	public void delAskChk(List board_no) {
		sqlSession.delete("mapper.sdy.deleteAskChk",board_no);		
	}
	//체크 선택시 삭제
	public void delReChk(List board_no) {
		sqlSession.delete("mapper.sdy.deleteAskReChk",board_no);		
	}
//	//글 상세 이전,다음글
//	public AskDTO movePage(String board_no)throws Exception{
//		return sqlSession.selectOne("mapper.sdy.movePage", board_no);
//	}

 
		 
}
