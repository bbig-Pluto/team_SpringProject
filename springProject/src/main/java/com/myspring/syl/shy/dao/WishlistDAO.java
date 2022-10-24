package com.myspring.syl.shy.dao;

import java.util.List;

import com.myspring.syl.shy.dto.WishlistDTO;

public interface WishlistDAO {
	
	public List selectWish();
	
	public WishlistDTO pickWish(int seqNum);
	
	public int insertWish(WishlistDTO wishDTO);
	
	public int updateWish(WishlistDTO wishDTO);
	
	public int deleteWish(WishlistDTO wishDTO);
	
	public WishlistDTO selCategory(String category);
	
	public List searchCategory(String category);
	
	public void checkDel(List seqNum);
	
}
