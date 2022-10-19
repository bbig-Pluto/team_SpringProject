package com.myspring.syl.sdy.controller;

import java.util.ArrayList;
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

import com.myspring.syl.sdy.dto.NoticeDTO;
import com.myspring.syl.sdy.service.NoticeService;


/**
 * Servlet implementation class NotiveServlet
 */
@Controller
public class NoticeController extends HttpServlet {
	@Autowired
	NoticeService noticeService;
	
	//전체 리스트 보여주는 페이지
	@RequestMapping(value="/notice",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listMembers() {
		ModelAndView mav = 	new ModelAndView();
		
		List<NoticeDTO> list = noticeService.getNoticeList();
		mav.addObject("list",list);
		mav.setViewName("sdy/notice_show");
		
		return mav;
	}
	
	//상세페이지
	@RequestMapping(value="/Ndetail",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView detail(@RequestParam("board_no") String board_no) {
		ModelAndView mav = 	new ModelAndView();
		System.out.println("board_no: "+ board_no);
		NoticeDTO dto= noticeService.getDetailContents(board_no);
		mav.addObject("list",dto);
		mav.setViewName("sdy/notice_detail");
		
		return mav;
	}
	//상세 페이지로
	@RequestMapping(value="/notice_detail",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView goDetail() {
		ModelAndView mav = 	new ModelAndView();
		mav.setViewName("sdy/notice_detail");
		
		return mav;
	}	
	//글쓰기 페이지로
	@RequestMapping(value="/notice_write",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView mod() {
		ModelAndView mav = 	new ModelAndView();
		mav.setViewName("sdy/notice_write");
		
		return mav;
	}	
	//글등록
		@RequestMapping(value="/Ninsert",method= {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView Ninsert(	
									@RequestParam("title") String title,
									@RequestParam("content") String content,
									@RequestParam("n_set") String n_set
									) {
			NoticeDTO noticeDTO= new NoticeDTO();
			noticeDTO.setContent(content);
			noticeDTO.setTitle(title);
			noticeDTO.setN_set(n_set);

			noticeService.getNoticeInsertList(noticeDTO);
			ModelAndView mav = 	new ModelAndView("redirect:/notice");
			return mav;
		}
	//검색기능
		@RequestMapping(value="/Nsearch",method= {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView listSelect(	@RequestParam("ser_name") String ser_name,
										@RequestParam("search") String search
				) {
				if("글제목".equals(ser_name)) {
					ModelAndView mav = 	new ModelAndView();
					List<NoticeDTO> list = noticeService.getSearchNoticeList(search);
					mav.addObject("list",list);
					mav.setViewName("sdy/notice_show");
					return mav;
				}else {
					
					ModelAndView mav = 	new ModelAndView();
					
					List<NoticeDTO> list = noticeService.getNoticeList();
					mav.addObject("list",list);
					mav.setViewName("sdy/notice_show");
					
					return mav;
				}

			}
		
		//글삭제
		@RequestMapping(value="/Ndel",method= {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView DelContent(
									@RequestParam("board_no") String board_no
				) {
			noticeService.getNoticeDelList(board_no);
			
			ModelAndView mav = 	new ModelAndView("redirect:/notice");
			return mav;
		}
		//글수정 페이지로 
		@RequestMapping(value="/Nmod",method= {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView mod(@RequestParam("board_no") String board_no) throws Exception {
			
			ModelAndView mav = 	new ModelAndView();
			NoticeDTO dto= noticeService.getDetailContents(board_no);
			mav.addObject("list",dto);
		    System.out.println("글수정 getboard_no : "+dto.getBoard_no());
			
			mav.setViewName("sdy/notice_mod");
			
			return mav;
		}
		//글수정하기
		@RequestMapping(value="/notice_mod_write",method= {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView ModContent(
				@ModelAttribute NoticeDTO noticeDTO,
				@RequestParam("board_no") String board_no,
				@RequestParam("content") String content,
				@RequestParam("title") String title,
				@RequestParam("n_set") String n_set
				) {
			noticeService.getNoticeModList(noticeDTO);
			ModelAndView mav = 	new ModelAndView("redirect:/Ndetail?board_no="+board_no);
			return mav;
		}
		//체크 시 삭제 
		@RequestMapping(value="/NdelCheck",method= {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView delChk(
				HttpServletRequest request
				) {
			
			String[] check = request.getParameterValues("check");
			List<String> list = new ArrayList();
			for(int i =0; i<check.length; i++) {
				list.add(check[i]);		
			}
			noticeService.getNoticeDelChk(list);
			
			ModelAndView mav = 	new ModelAndView("redirect:/notice");
			return mav;
		}

}

