package com.myspring.syl.sdy.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.syl.sdy.dto.QaDTO;
import com.myspring.syl.sdy.service.QaService;




@Controller
public class QaController extends HttpServlet {
	@Autowired
	QaService qaService;
	
	//전체 리스트 보여주는 페이지
		@RequestMapping(value="/qa",method= {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView listMembers() {
			ModelAndView mav = 	new ModelAndView();
			
			List<QaDTO> list = qaService.getQaList();
			mav.addObject("list",list);
			mav.setViewName("sdy/q_a_show");
			
			return mav;
		}
		//글쓰기
		@RequestMapping(value="/Qinsert",method= {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView Qainsert(@ModelAttribute QaDTO qaDTO,
				
				@RequestParam("question") String question,
				@RequestParam("answer") String answer
				) {
			
			qaService.getQaInsertList(qaDTO);
			ModelAndView mav = 	new ModelAndView("redirect:/qa");
			return mav;
		}
		//글쓰기페이지로 보냄
		@RequestMapping(value="/Qwrite",method= {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView Qwirte() {
			ModelAndView mav = 	new ModelAndView();
			mav.setViewName("sdy/q_a_write");
			
			return mav;
		}
		
		//글수정하기
		@RequestMapping(value="/qa_mod_write",method= {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView ModContent(
				@ModelAttribute QaDTO qaDTO,
				@RequestParam("q_no") String q_no,
				@RequestParam("answer") String answer,
				@RequestParam("question") String question
				) {
			qaService.getQaModList(qaDTO);
			
			ModelAndView mav = 	new ModelAndView("forward:/qa");
			return mav;
		}
		//수정페이지로
		@RequestMapping(value="/qa_mod",method= {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView mod(
				@RequestParam("q_no") String q_no,
				@RequestParam("answer") String answer,
				@RequestParam("question") String question	
				) throws Exception {
				ModelAndView mav = 	new ModelAndView();
				mav.setViewName("/sdy/q_a_rewrite");
			
			
				return mav;
		}
		//체크 시 삭제 
				@RequestMapping(value="/qa_delCheck",method= {RequestMethod.GET,RequestMethod.POST})
				public ModelAndView delContent(
						@ModelAttribute QaDTO qaDTO,
						HttpServletRequest request
						) {
					
					String[] check = request.getParameterValues("check");
					List<String> list = new ArrayList();
					for(int i =0; i<check.length; i++) {
						list.add(check[i]);		
					}
					qaService.getQaDelList(list);
					
					ModelAndView mav = 	new ModelAndView("redirect:/qa");
					return mav;
				}
		

}
