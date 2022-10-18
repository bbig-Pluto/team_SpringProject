package com.myspring.syl.shy.service;

import java.util.List;

import com.myspring.syl.shy.dto.WishlistDTO;

public interface WishlistService {
	
	List<WishlistDTO> getWishList();
	
	WishlistDTO getPickWish(int seqNum);

}
