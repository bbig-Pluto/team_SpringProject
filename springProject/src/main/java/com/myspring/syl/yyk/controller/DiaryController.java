package com.myspring.syl.yyk.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myspring.syl.yyk.dto.DiaryDTO;
import com.myspring.syl.yyk.service.DiaryService;

@Controller
public class DiaryController {

	@Autowired
	DiaryService diaryService;
	
	
	// 일기장 조회
	@RequestMapping(value="/diaryList", method= {RequestMethod.GET, RequestMethod.POST})
	public String diaryList(Model model, HttpServletRequest request) {
		
		// 세션 아이디 받기
		HttpSession logOnSession = request.getSession();
		String sessionId = "" + logOnSession.getAttribute("logOn.id");
		System.out.println("logOnSession : "+ sessionId);
		
		List<DiaryDTO> list = diaryService.getDiaryList(sessionId);
//		List<DiaryDTO> list = diaryService.getDiaryList();

		model.addAttribute("list", list);
		
		return "/yyk/diaryList";
	}
	
	// 일기장 추가
	@RequestMapping(value="/addDiary", method = {RequestMethod.GET, RequestMethod.POST})
	public String addDiary(Model model,
							@ModelAttribute DiaryDTO diaryDTO, // 입력 받은 값 알아서 저장해줌
							MultipartHttpServletRequest multipartRequest,
							HttpServletRequest request) throws Exception {
		
		// 세션 아이디 받기
		HttpSession logOnSession = request.getSession();
		String sessionId = "" + logOnSession.getAttribute("logOn.id");
		System.out.println("logOnSession : "+ sessionId);
		
		System.out.println(">>> addDiary controller route");
		System.out.println("addDiary : title : " + diaryDTO.getD_title());
		System.out.println("addDiary : content : " + diaryDTO.getD_content());
		System.out.println("addDiary : weather : " + diaryDTO.getD_weather());
		System.out.println("addDiary : weather : " + diaryDTO.getD_emotion());
		
		//file
		String originalFileName = fileProcess(multipartRequest);
		System.out.println("addDiary : 파일 이름 : " + originalFileName);
		
//		diaryDTO.setId(sessionId);
		diaryDTO.setD_fileName(originalFileName);
		
		diaryService.getAddDiary(diaryDTO);
		
		return "redirect:/diaryList";
	}
	
	// 일기장 수정
	@RequestMapping(value="/updateDiary", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateDiary(Model model,
							// 입력 받은 값 알아서 저장해줌
							@ModelAttribute("diaryDTO") DiaryDTO diaryDTO,
							MultipartHttpServletRequest multipartRequest,
							HttpServletRequest request) throws Exception {
		
		HttpSession logOnSession = request.getSession();
		String sessionId = "" + logOnSession.getAttribute("logOn.id");
		System.out.println("logOnSession : "+ sessionId);
		
		System.out.println(">>> updateDiary controller route");
		System.out.println("updateDiary : title : " + diaryDTO.getD_title());
		System.out.println("updateDiary : content : " + diaryDTO.getD_content());
		System.out.println("updateDiary : weather : " + diaryDTO.getD_weather());
		System.out.println("updateDiary : emotion : " + diaryDTO.getD_emotion());
		
		//file
		String originalFileName = fileProcess(multipartRequest);
		System.out.println("addDiary : 파일 이름 : [" + originalFileName +"]");
				
		diaryDTO.setId(sessionId);
		diaryDTO.setD_fileName(originalFileName);
		
		int result = diaryService.getUpdateDiary(diaryDTO);
		System.out.println("controller : update된 행 개수 : " + result);
//		model.addAttribute("diaryDTO", diaryDTO);
		
		return "redirect:/diaryList";
	}
	
	// 일기장 삭제
	@RequestMapping(value="/delDiary", method= {RequestMethod.GET, RequestMethod.POST})
	public String delDiary(Model model,
							// 입력 받은 값 알아서 저장해줌
							@ModelAttribute DiaryDTO diaryDTO,
							HttpServletRequest request) {
		
		// 세션 아이디 받기
		HttpSession logOnSession = request.getSession();
		String sessionId = "" + logOnSession.getAttribute("logOn.id");
		System.out.println("logOnSession : "+ sessionId);
		
		System.out.println(">>> delDiary controller route");
		System.out.println("delDiary : title : " + diaryDTO.getD_title());
		System.out.println("delDiary : content : " + diaryDTO.getD_content());
			
		diaryDTO.setId(sessionId);
		int result = diaryService.getDelDiary(diaryDTO);
//		System.out.println("controller : delete된 행 개수 : " + result);
//		model.addAttribute("diaryDTO", diaryDTO);
			
		return "redirect:/diaryList";
	}
	
	// 일기장 검색
	@RequestMapping(value="/searchDiary", method= {RequestMethod.GET, RequestMethod.POST})
	public String searchDiary(Model model,
							// 입력 받은 d_title만 dto에 값 저장 해주고
							// 나머지 필드는 초기값 (null)
							@ModelAttribute DiaryDTO diaryDTO,
							HttpServletRequest request) {
			
		HttpSession logOnSession = request.getSession();
		String sessionId = "" + logOnSession.getAttribute("logOn.id");
		System.out.println("logOnSession : "+ sessionId);
		
		System.out.println(">>> searchDiary controller route");
		System.out.println("searchDiary : title : " + diaryDTO.getD_title());
			
		diaryDTO.setId(sessionId);
		List<DiaryDTO> list = diaryService.getSearchDiary(diaryDTO);
//		model.addAttribute("diaryDTO", diaryDTO);
			
		model.addAttribute("list", list);
		
		return "/yyk/searchDiary";
	}
	
	
	
		// 일기장 추가 페이지로 이동
		@RequestMapping(value="/addDiaryList", method=RequestMethod.GET)
		public String addDiaryList(Model model) {
			System.out.println("다이어리 추가 페이지로 이동");
			
			return "/yyk/addDiary";
		}
		
		// 일기장 상세 페이지로 이동
		@RequestMapping(value="/detailDiary", method=RequestMethod.GET)
		public String detailDiary(Model model) {
			System.out.println("다이어리 상세 페이지로 이동");
			
			return "/yyk/detailDiary";
		}
		
		
		//파일 저장 위치를 지정
		private static final String CURR_IMAGE_REPO_PATH = "c:\\spring\\image_repo";
		
		// 파일 다운로드 메소드
		private String fileProcess(MultipartHttpServletRequest multipartRequest)throws Exception {
			
			// 첨부된 파일 모두다 가져옴
			Iterator<String> fileNames =  multipartRequest.getFileNames(); 
			
				// 첨부된 파일 이름을 가져옴
				String fileName = fileNames.next(); 
				System.out.println("fileName : " + fileName);
				
				// 파일 이름에 대한 MultipartFile 객체를 가져옴
				MultipartFile mFile = multipartRequest.getFile(fileName);                          
				
				// 실제 파일 이름을 가져옴
				String originalFileName = mFile.getOriginalFilename();
				System.out.println("originalFileName : " + originalFileName );
				
				File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
				
				if(mFile.getSize()!=0) { // 첨부된 파일이 있는지 체크
					// 경로에 파일이 없으면 그 경로에 해당하는 디렉터리를 만든 후 파일을 생성
					if(! file.exists()) {
						if(file.getParentFile().mkdirs()) {
							file.createNewFile(); // 폴더가 없으면 부모 폴더까지 만들어줌
						}
					}
					// 임시로 저장된 multiFile을 실제 파일로 전송
					mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName));
				}
			
			return originalFileName; 
		}

		
		
		
}
