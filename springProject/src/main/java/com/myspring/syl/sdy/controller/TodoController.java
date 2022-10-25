package com.myspring.syl.sdy.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.syl.sdy.dto.TodoDTO;
import com.myspring.syl.sdy.service.TodoService;
import com.myspring.syl.yyk.service.MemoService;


@RestController
public class TodoController extends HttpServlet {

	@Autowired
	TodoService todoService;
	
	@Autowired
	MemoService memoService;
	
	//todo 입력 ajax
	@RequestMapping(value="/todoInsert",method= {RequestMethod.POST})
	public  TodoDTO listTodo(@RequestBody TodoDTO dto,
							HttpServletRequest request) {
		
		System.out.println("인서트 진입");
		int todo_id = todoService.getTodoInsertList(dto);
	
		return dto;
	}
	//전체 리스트 보여주는 페이지
	@RequestMapping(value="/todo",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listTodo(HttpServletRequest request) {
		ModelAndView mav = 	new ModelAndView();
		
		// 세션 아이디 받기
				HttpSession logOnSession = request.getSession();
				String sessionId = "" + logOnSession.getAttribute("logOn.id");
				System.out.println("logOnSession : "+ sessionId);

				String memoContent = memoService.getMemoList(sessionId);
				
				List<TodoDTO> list = todoService.getTodoList();
				mav.addObject("list",list);
				// content 에 add 라는 메시지가 담겨서 오면 addMemo 로 rediecting
				if(memoContent.equals("add")) {
					System.out.println("/memoList -> addMemo.jsp route");
					mav.setViewName("yyk/addMemo");
				// 이미 memo 를 작성한 적이 있는 사람의 분기
				} else {
					mav.addObject("m_content",memoContent);
					System.out.println("/memoList -> memoList.jsp route");
					mav.setViewName("yyk/memoList");
				}
		
		
		return mav;
	}
		//체크 시 삭제
		@RequestMapping(value="/todo_delCheck",method= {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView delContent(
				HttpServletRequest request
				) {
			System.out.println("del todo 진입");
			String[] check = request.getParameterValues("todo_chk");
			String[] ids = request.getParameterValues("todo_id");
			List<String> list = new ArrayList();
			for(int i =0; i<ids.length; i++) {
				System.out.println("chk: "+check[i]);
				System.out.println("id: "+ids[i]);
				if(check[i].equals("1")) {
					list.add(ids[i]);		
				}
			}
			todoService.getTodoDelChk(list);
			
			ModelAndView mav = 	new ModelAndView("redirect:/todo");
			return mav;
		}
		//todo chk수정 ajax
		@RequestMapping(value="/todoMod",method= {RequestMethod.POST})
		public  List chkMod(@RequestBody TodoDTO dto) {
			System.out.println("수정 진입");
			System.out.println("수정 chk"+dto.getChk());
			System.out.println("수정 id"+dto.getTodo_id());
			todoService.getModTodoChk(dto);
			List list = new ArrayList();
			list.add(dto);
			return list;
		}
		//todo chkAll수정 ajax
		@RequestMapping(value="/todoModAll",method= {RequestMethod.POST})
		public  Map chkAllMod(@RequestBody Map map,
				HttpServletRequest request) {
			
			HttpSession userInfo = request.getSession();
			String sessionId = "" + userInfo.getAttribute("logOn.id");
			
			System.out.println("전체 수정 진입");
			System.out.println("map chk :"+map.get("chk"));
			System.out.println("map ids :"+map.get("todo_id"));
			map.put("id", sessionId);		
			map.put("chk", ((List)map.get("chk")).get(0));		
				
		todoService.getModTodoAllChk(map);
			return map;
		}
}
