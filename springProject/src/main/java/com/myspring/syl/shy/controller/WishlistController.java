 package com.myspring.syl.shy.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.syl.shy.dto.WishlistDTO;
import com.myspring.syl.shy.service.WishlistService;

@Controller
public class WishlistController {
	
	@Autowired
	WishlistService wishService;
	
	/* 전체 조회 */
	@RequestMapping(value="/mainwish",
					method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listWish(
			) {
		
		ModelAndView mav = new ModelAndView();
		
		List<WishlistDTO> list = wishService.getWishList();
		
		mav.addObject("wishlist", list);
		mav.setViewName("/shy/MainWish");
		
		return mav;
	}
	
	/* 상세 페이지 */
	@RequestMapping(value="/pickwish",
					method= {RequestMethod.GET, RequestMethod.POST})
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
					method= {RequestMethod.GET, RequestMethod.POST})
	public String insertWish(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("category") String category,
			@RequestParam("name") String name,
			@RequestParam("price") int price,
			@RequestParam("link") String link,
			MultipartHttpServletRequest multipartRequest
			) throws Exception {
		/* 파일 저장 */
		String originalFileName = fileProcess(multipartRequest);
		
		System.out.println("상품 추가 파일 이름 : " + originalFileName );
		
		/* insert 정보 저장 */
		WishlistDTO wishDTO = new WishlistDTO();
		
		wishDTO.setCategory(category);
		wishDTO.setName(name);
		wishDTO.setPrice(price);
		wishDTO.setPhoto(originalFileName);
		wishDTO.setLink(link);
		
		System.out.println("카테고리 : " + wishDTO.getCategory());
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
			HttpServletResponse response
			) {
		
		List<WishlistDTO> list = wishService.getWishList();
		request.setAttribute("wishlist", list);
		
		return "/shy/InsertWish";
	}
	
	/* 수정 화면으로 이동 */
	@RequestMapping(value="/updatewishpage",
					method=RequestMethod.GET)
	public String updateWishPage(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("seqNum") int seqNum
			) {
		
		List<WishlistDTO> list = wishService.getWishList();
		request.setAttribute("wishlist", list);
		
		WishlistDTO updatepage = wishService.getPickWish(seqNum);
		request.setAttribute("pickwish", updatepage);
		
		return "/shy/UpdateWish";
		
				
	}
	
	/* 수정 */
	@RequestMapping(value="/updatewish",
					method= {RequestMethod.GET, RequestMethod.POST})
	public String updateWish(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("seqNum") int seqNum,
			@RequestParam("category") String category,
			@RequestParam("name") String name,
			@RequestParam("price") int price,
			@RequestParam("link") String link,
			MultipartHttpServletRequest multipartRequest
			) throws Exception {
		
		/* 파일 저장 */
		String originalFileName = fileProcess(multipartRequest);
		
		System.out.println("수정된 이미지 이름 : " + originalFileName );
		
		List<WishlistDTO> list = wishService.getWishList();
		request.setAttribute("wishlist", list);
		
		WishlistDTO wishDTO = new WishlistDTO();
		
		wishDTO.setSeqNum(seqNum);
		wishDTO.setCategory(category);
		wishDTO.setName(name);
		wishDTO.setPhoto(originalFileName);
		wishDTO.setPrice(price);
		wishDTO.setLink(link);
		
		int updatewish = wishService.getUpdateWish(wishDTO);
		request.setAttribute("updatewish", updatewish);
		
		return "forward:/pickwish";
		
	}
	
	/* 삭제 */
	@RequestMapping(value="/deletewish",
					method=RequestMethod.GET)
	public String deleteWish(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("seqNum") int seqNum
			) {
		
		WishlistDTO wishDTO = new WishlistDTO();
		
		wishDTO.setSeqNum(seqNum);
		
		int deletewish = wishService.getDeleteWish(wishDTO);
		
		return "forward:/mainwish";
	}
	
	/* 파일 저장 위치 지정 */
	private static final String CURR_IMAGE_REPO_PATH = "c:\\spring\\image_repo";
	
	/* 파일 업로드 */
	private String fileProcess(MultipartHttpServletRequest multipartRequest)throws Exception {
		
		/* 첨부 파일 모두 가져오기 */
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		/* 첨부 파일의 이름 가져오기 */
		String fileName = fileNames.next();
		System.out.println("fileName : " + fileName);
		
		/* 파일 이름에 대한 MultipartFile 객체 가져오기 */
		MultipartFile mFile = multipartRequest.getFile(fileName);
		
		/* 실제 파일 이름 가져오기 */
		String originalFileName = mFile.getOriginalFilename();
		System.out.println("originalFileName : " + originalFileName);
		
		/* 파일 이름 하나씩 fileList에 저장하기 */
		File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
		
		/* 첨부된 파일이 있는지 체크 */
		if ( mFile.getSize() != 0) {
			
			/* 경로에 파일이 없으면 그 경로에 해당하는 디렉터리 만든 후 파일 생성 */
			if ( ! file.exists() ) {
				
				/* 폴더가 없다면 부모 폴더까지 만듬 */
				if ( file.getParentFile().mkdirs() ) {
					file.createNewFile();
				}
			}
			
			/* 임시로 저장된 multiFile을 실제 파일로 전송 */
			mFile.transferTo( new File (CURR_IMAGE_REPO_PATH + "\\" + originalFileName) );
		}
		
		/* 실제 파일 return */
		return originalFileName;
		
		
	}
	
	/* 카테고리 조회 */
	@RequestMapping(value="/searchcategory",
					method= {RequestMethod.GET, RequestMethod.POST})
	public String searchCategory(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("category") String category
			) {
		
		List<WishlistDTO> search = wishService.getSearchCategory(category);
		request.setAttribute("search", search);
		
		return "/shy/CategoryWish";
	}
	

}
