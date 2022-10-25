package com.myspring.syl.yyk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.syl.yyk.dto.MemoDTO;
import com.myspring.syl.yyk.service.MemoService;

@Controller
public class MemoController {
	
	@Autowired
	MemoService memoService;
	
	
	// memoList
	@RequestMapping(value="/memoList", method = {RequestMethod.GET, RequestMethod.POST})
	public String memoList(Model model, HttpServletRequest request) {
		System.out.println("controller memoList route");
		
		// 세션 아이디 받기
		HttpSession logOnSession = request.getSession();
		String sessionId = "" + logOnSession.getAttribute("logOn.id");
		System.out.println("logOnSession : "+ sessionId);

		String memoContent = memoService.getMemoList(sessionId);
		
		// content 에 add 라는 메시지가 담겨서 오면 addMemo 로 rediecting
		if(memoContent.equals("add")) {
			System.out.println("/memoList -> addMemo.jsp route");
			return "/yyk/addMemo";
		// 이미 memo 를 작성한 적이 있는 사람의 분기
		} else {
			model.addAttribute("m_content", memoContent);
			System.out.println("/memoList -> memoList.jsp route");
			return "/yyk/memoList";
		}
	}
	
	
	
	// addMemo
	@RequestMapping(value="/addMemo", method = {RequestMethod.GET, RequestMethod.POST})
	public String addMemo(Model model, HttpServletRequest request,
							  @RequestParam(value="m_content", required=false) String m_content ) {
		
		// 세션 아이디 받기
		HttpSession logOnSession = request.getSession();
		String sessionId = "" + logOnSession.getAttribute("logOn.id");
		System.out.println("logOnSession : "+ sessionId);
		
		System.out.println("controller addMemo route");
		System.out.println("addMemo : m_content : " + m_content);

		Map map = new HashMap();
		map.put("sessionId", sessionId);
		map.put("m_content", m_content);
		
		int result = memoService.getAddMemo(map);
		System.out.println("insert : " + result);
		
		return "redirect:/todo";
	}
	
	
	// updateMemo
	@RequestMapping(value="/updateMemo", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateMemo(Model model, HttpServletRequest request,
							  @RequestParam(value="m_content", required=false) String m_content ) {
		
		// 세션 아이디 받기
		HttpSession logOnSession = request.getSession();
		String sessionId = "" + logOnSession.getAttribute("logOn.id");
		System.out.println("logOnSession : "+ sessionId);
		
		System.out.println("controller updateMemo route");
		System.out.println("updateMemo : m_content : " + m_content);
		
		Map map = new HashMap();
		map.put("sessionId", sessionId);
		map.put("m_content", m_content);
		
		int result2 = memoService.getUpdateMemo(map);
		System.out.println("update : " + result2);
		
		return "redirect:/todo";
	}
}
