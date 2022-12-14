package com.myspring.syl.shy.service;

import java.util.List;

import com.myspring.syl.shy.dto.WishlistDTO;

public interface WishlistService {
	
	List<WishlistDTO> getWishList(String sessionId);
	
	WishlistDTO getPickWish(int seqNum);
	
	int getInsertWish(WishlistDTO wishDTO);
	
	int getUpdateWish(WishlistDTO wishDTO);
	
	int getDeleteWish(WishlistDTO wishDTO);
	
//	WishlistDTO getSelCategory(String category);
	
	List<WishlistDTO> getSearchCategory(String category);
	
	public void getCheckDel(List seqNum);
	
}
