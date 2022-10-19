package com.myspring.syl.sdy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.syl.sdy.dto.AskDTO;
import com.myspring.syl.sdy.dto.ReplyDTO;
import com.myspring.syl.sdy.service.AskService;




/**
 * Servlet implementation class AskServlet
 */
@Controller
public class AskController extends HttpServlet {
	@Autowired
	AskService askService;
	
	
	//전체 리스트 보여주는 페이지
	@RequestMapping(value="/ask",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listMembers() {
		ModelAndView mav = 	new ModelAndView();
		
		List<AskDTO> list = askService.getMemberList();
		mav.addObject("list",list);
		mav.setViewName("/sdy/ask_show");
		return mav;
	}

	//글쓰기페이지로 보냄
	@RequestMapping(value="/write",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView wirte() {
		ModelAndView mav = 	new ModelAndView();
		mav.setViewName("/sdy/ask_write");
		
		return mav;
	}
	//글쓰기 
	@RequestMapping(value="/insert",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView insert(	
			@RequestParam("ask_classify") String ask_classify,
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			@RequestParam("ask_secret") String ask_secret,
			@RequestParam("board_no") String board_no,
			@RequestParam(value="ask_pwd",required=false) String ask_pwd ,
			HttpServletRequest request
			) {
		
		 HttpSession userInfo = request.getSession();
			String sessionId = "" + userInfo.getAttribute("logOn.id");
			System.out.println("글쓰기 아이디: "+sessionId);
		AskDTO askDTO= new AskDTO();
		System.out.println("parent_no  :  "+board_no);
		askDTO.setAsk_classify(ask_classify);
		askDTO.setParent_no(board_no);
		System.out.println("parent_no_GET : "+askDTO.getParent_no());
		askDTO.setAsk_pwd(ask_pwd);
		askDTO.setAsk_secret(ask_secret);
		askDTO.setContent(content);
		askDTO.setTitle(title);
		askDTO.setId(sessionId);
		
		askService.getInsertList(askDTO);
		ModelAndView mav = 	new ModelAndView("redirect:/ask");
		return mav;
	}
	//답글쓰기페이지로 보냄
	@RequestMapping(value="/reWrite",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView reWrite() {
		ModelAndView mav = 	new ModelAndView();
		mav.setViewName("/sdy/ask_rewrite");
		
		return mav;
	}
	//댓글쓰기 
	@RequestMapping(value="/insertReply",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView insert(	
								@RequestParam("board_no") String board_no,
								@RequestParam("content") String content,
								HttpServletRequest request
								
								) {
		 HttpSession userInfo = request.getSession();
			String sessionId = "" + userInfo.getAttribute("logOn.id");
			System.out.println("글쓰기 아이디: "+sessionId);
			
			ReplyDTO dto = new ReplyDTO();
		
			dto.setBoard_no(board_no);
			dto.setContent(content);
			dto.setId(sessionId);

		askService.getInsertReply(dto);
		ModelAndView mav = 	new ModelAndView("redirect:/detail?board_no="+board_no);
		return mav;
	}
	//상세페이지
	@RequestMapping(value="/detail",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView detail(@RequestParam("board_no") String board_no) throws Exception {
		ModelAndView mav = 	new ModelAndView();
		System.out.println("board_no: "+ board_no);
		
		AskDTO dto= askService.getDetailContents(board_no);
		mav.addObject("list",dto);
		System.out.println("count: "+dto.getReply_count());
		askService.getCountReply(board_no);//게시글에 들어가면 댓글수 업데이트

		List<ReplyDTO> list = askService.getReplyList(board_no);
		mav.addObject("ReplyList",list);
		
		mav.setViewName("/sdy/ask_detail");
		
		return mav;
	}
	//수정페이지로
	@RequestMapping(value="/ask_mod",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView mod(@RequestParam("board_no") String board_no) throws Exception {
		ModelAndView mav = 	new ModelAndView();
		AskDTO dto= askService.getDetailContents(board_no);
		mav.addObject("list",dto);
		
		mav.setViewName("/sdy/ask_mod");
		
		return mav;
	}
	//비밀번호 실패 페이지로
	@RequestMapping(value="/ask_pwd_fail",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView ask_pwd_fail(@RequestParam("board_no") String board_no) throws Exception {
		ModelAndView mav = 	new ModelAndView();
		
		mav.setViewName("/sdy/ask_pwd_fail");
		
		return mav;
	}
	
	//비밀글 입력페이지
	@RequestMapping(value="/ask_pwd",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView pwd() {
		ModelAndView mav = 	new ModelAndView();
		mav.setViewName("/sdy/ask_pwd");
		return mav;
	}
	//글삭제
	@RequestMapping(value="/ask_del",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView DelContent(
								@RequestParam("board_no") String board_no
			) {
		AskDTO dto = new AskDTO();
		System.out.println("del의 board_no : "+board_no);
		askService.getDelList(board_no);
		
		ModelAndView mav = 	new ModelAndView("redirect:/ask");
		return mav;
	}
	//댓글삭제
	@RequestMapping(value="/ask_reply_del",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView DelReply(
			@RequestParam("re_no") String re_no,
			@RequestParam("board_no") String board_no
			) {
		AskDTO dto = new AskDTO();
		System.out.println("del의 re_no : "+re_no);
		askService.getDelReplyList(re_no);
		
		ModelAndView mav = 	new ModelAndView("redirect:/detail?board_no="+board_no);
		return mav;
	}
	//체크 시 삭제 
	@RequestMapping(value="/AdelCheck",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView delAskChk(	HttpServletRequest request) {
				String[] check = request.getParameterValues("check");
				List<String> list = new ArrayList();
				for(int i =0; i<check.length; i++) {
					list.add(check[i]);		
				}
				askService.getAskDelChk(list);
				
				ModelAndView mav = 	new ModelAndView("redirect:/ask");
				return mav;
			}

	//글수정하기
	@RequestMapping(value="/ask_mod_write",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView ModContent(
			@ModelAttribute AskDTO askDTO,
			@RequestParam("board_no") String board_no,
			@RequestParam("content") String content,
			@RequestParam("title") String title,
			@RequestParam("ask_classify") String ask_classify,
			@RequestParam("ask_secret") String ask_secret,
			@RequestParam("ask_pwd") String ask_pwd
			) {
		askService.getModList(askDTO);
		
		ModelAndView mav = 	new ModelAndView("redirect:/detail?board_no="+board_no);
		return mav;
	}
	
	//비밀번호 비교
	@RequestMapping(value="/ask_check",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView pwd_check(@ModelAttribute AskDTO askDTO,
									@RequestParam("board_no") String board_no,
									@RequestParam("input_pwd") String input_pwd) {
		String ask_pwd = askService.getPw(board_no);
		System.out.println("게시글의 비밀번호: "+ask_pwd);
		if(ask_pwd.equals(input_pwd)) {
			ModelAndView mav = 	new ModelAndView("redirect:/detail?board_no="+board_no);
			return mav;
		}else {
			ModelAndView mav = 	new ModelAndView("redirect:/ask_pwd_fail?board_no="+board_no);
			return mav;
		}
	
		
	}
	
	//검색기능
	@RequestMapping(value="/search",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listSelect(@ModelAttribute HashMap<String,String> hashMap,
									@RequestParam("ser_name") String ser_name,
									@RequestParam("q_head") String q_head,
									@RequestParam("search") String search
			) {
		
		System.out.println("/search/select 메소드 진입");
		System.out.println("q_head : "+q_head);
			
				hashMap.put("q_head", q_head);
				hashMap.put("ser_name", ser_name);
				hashMap.put("search", search);
				
				
				ModelAndView mav = 	new ModelAndView();
				
				
				List<AskDTO> list = askService.getSearchList(hashMap);
				mav.addObject("list",list);
				mav.setViewName("/sdy/ask_show");
				
				return mav;

	

		}


	
}
