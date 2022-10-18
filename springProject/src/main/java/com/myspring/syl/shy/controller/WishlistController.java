package com.myspring.syl.shy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	/* 전체 조회 */
	@RequestMapping(value="/mainwish",
					method=RequestMethod.GET)
	public ModelAndView listWish() {
		
		ModelAndView mav = new ModelAndView();
		
		List<WishlistDTO> list = wishService.getWishList();
		
		mav.addObject("wishlist", list);
		mav.setViewName("/shy/MainWish");
		
		return mav;
	}
	
	/* 상세 페이지 */
	@RequestMapping(value="/pickwish",
					method=RequestMethod.GET)
	public String pickWish(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("seqNum") int seqNum
			) {
		
		List<WishlistDTO> list = wishService.getWishList();
		request.setAttribute("wishlist", list);
		
		WishlistDTO pickwish = wishService.getPickWish(seqNum);
		request.setAttribute("pickwish", pickwish);
		
		return "/shy/ViewWish";
		
	}
	
	/* 상품 추가 */
	@RequestMapping(value="/insertwish",
					method=RequestMethod.GET)
	public String insertWish(
			HttpServletRequest request,
			HttpServletResponse response,
			Model model,
			@RequestParam("name") String name,
			@RequestParam("price") int price,
			@RequestParam("link") String link
			
			) {
		WishlistDTO wishDTO = new WishlistDTO();
		
		wishDTO.setName(name);
		wishDTO.setPrice(price);
		wishDTO.setLink(link);
		
		System.out.println("상품명 : "+ wishDTO.getName());
		
		int insertwish = wishService.getInsertWish(wishDTO);
		
		request.setAttribute("insertwish", insertwish);
		
		return "forward:/mainwish";
	}
	
	/* 상품 추가 페이지로 이동 */
	@RequestMapping(value="/insertwishpage",
					method= {RequestMethod.GET, RequestMethod.POST})
	public String insertWishPage(
			HttpServletRequest request,
			HttpServletResponse response,
			Model model
			) {
		
		List<WishlistDTO> list = wishService.getWishList();
		request.setAttribute("wishlist", list);
		
		return "/shy/InsertWish";
	}
	

}
