package com.myspring.syl.shy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.syl.shy.dto.WishlistDTO;
import com.myspring.syl.shy.service.WishlistService;

@Controller
public class WishlistController {
	
	@Autowired
	WishlistService wishService;
	
	@RequestMapping(value="/mainwish",
					method=RequestMethod.GET)
	public ModelAndView listWish() {
		
		ModelAndView mav = new ModelAndView();
		
		List<WishlistDTO> list = wishService.getWishList();
		
		mav.addObject("wishlist", list);
		mav.setViewName("/shy/MainWish");
		
		return mav;
	}
	
	@RequestMapping(value="/pickwish",
					method=RequestMethod.GET)
	public String pickWish(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("seqNum") int seqNum
			) {
		
		WishlistDTO pickwish = wishService.getPickWish(seqNum);
		request.setAttribute("pickwish", pickwish);
		
		return "/shy/ViewWish";
		
	}

}
