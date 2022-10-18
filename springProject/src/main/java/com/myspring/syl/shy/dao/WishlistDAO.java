package com.myspring.syl.shy.dao;

import java.util.List;

import com.myspring.syl.shy.dto.WishlistDTO;

public interface WishlistDAO {
	
	public List selectWish();
	
	public WishlistDTO pickWish(int seqNum);
	
	public int insertWish(WishlistDTO wishDTO);

}
