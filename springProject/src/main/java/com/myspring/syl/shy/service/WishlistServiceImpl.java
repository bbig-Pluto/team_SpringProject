package com.myspring.syl.shy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.syl.shy.dao.WishlistDAO;
import com.myspring.syl.shy.dto.WishlistDTO;

@Service
public class WishlistServiceImpl implements WishlistService {

	@Autowired
	WishlistDAO wishDAO;
	
	@Override
	public List<WishlistDTO> getWishList() {
		
		return wishDAO.selectWish();
	}

	@Override
	public WishlistDTO getPickWish(int seqNum) {
		
		WishlistDTO dto = new WishlistDTO();
		
		dto = wishDAO.pickWish(seqNum);

		return dto;
	}

}
