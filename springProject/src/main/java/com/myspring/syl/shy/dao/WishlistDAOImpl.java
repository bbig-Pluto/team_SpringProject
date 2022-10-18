package com.myspring.syl.shy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.syl.shy.dto.WishlistDTO;

@Repository
public class WishlistDAOImpl implements WishlistDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List selectWish() {

		List<WishlistDTO> list = sqlSession.selectList("mapper.shy.selectWishlist");
		
		return list;
	}

	@Override
	public WishlistDTO pickWish(int seqNum) {

		WishlistDTO dto = new WishlistDTO();
		
		dto.setSeqNum(seqNum);
		
		dto = sqlSession.selectOne("mapper.shy.pickWishlist", seqNum);
		
		return dto;
	}

	@Override
	public int insertWish(WishlistDTO wishDTO) {

		int result = sqlSession.insert("mapper.shy.insertWishlist", wishDTO);
		
		return result;
	}


}
