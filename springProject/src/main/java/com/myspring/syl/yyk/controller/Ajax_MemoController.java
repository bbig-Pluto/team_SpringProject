//package com.myspring.syl.yyk.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.myspring.syl.yyk.dto.MemoDTO;
//import com.myspring.syl.yyk.service.MemoService;
//
//@RestController
//public class Ajax_MemoController {
//	
//	@Autowired
//	MemoService memoService;
//	
//	
//	@RequestMapping(value="/Ajax_mainMemo", method = {RequestMethod.GET, RequestMethod.POST})
//	public String memoContent() {
//		System.out.println("controller mainMemo route");
//		
//		return "/yyk/Ajax_addMemo";
//	}
//	
//	
//	@RequestMapping(value="/Ajax_addMemo", method = {RequestMethod.GET, RequestMethod.POST})
//	public String memoContent(Model model,
//							  @RequestParam("content") String content) {
//		System.out.println("controller addMemo route");
//		System.out.println("addMemo : m_content : " + content);
//		
//		int memo = memoService.getMemoContent(content);
//		model.addAttribute("memo", memo);
//		
//		return "/yyk/Ajax_updateMemo";
//	}
//	
//	
//	@RequestMapping(value="/Ajax_updateMemo", method = {RequestMethod.GET, RequestMethod.POST})
//	public String memoContent2(Model model,
//							  @RequestParam(value="m_content", required=false) String m_content ) {
//		System.out.println("controller updateMemo route");
//		System.out.println("updateMemo : m_content : " + m_content);
//		
//		int memo = memoService.getMemoContent2(m_content);
//		model.addAttribute("memo", memo);
//		
//		return "/yyk/Ajax_updateMemo";
//	}
//}
