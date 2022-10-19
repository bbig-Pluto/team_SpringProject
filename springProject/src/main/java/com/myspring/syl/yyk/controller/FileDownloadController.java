package com.myspring.syl.yyk.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;


@Controller
public class FileDownloadController {
	// 파일 저장 위치 지정
	private static String CURR_IMAGE_REPO_PATH = "c:\\spring\\image_repo";

//	@RequestMapping("/download")
//	public void download(@RequestParam("imageFileName") String imageFileName,
//			                 HttpServletResponse response)throws Exception {
//		OutputStream out = response.getOutputStream();
//		String filePath = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
//		File image = new File(filePath);
//		
//		int lastIndex = imageFileName.lastIndexOf(".");
//		String fileName = imageFileName.substring(0,lastIndex);
//		
//		File thumbnail = new File(CURR_IMAGE_REPO_PATH+ "\\" + "thumbnail" + "\\" + fileName + ".png");
//		if(image.exists()) {
//			thumbnail.getParentFile().mkdirs();
//			Thumbnails.of(image).size(50,50).outputFormat("png").toFile(thumbnail);
//		}
//		
//		FileInputStream in = new FileInputStream(thumbnail);
//		byte[] buffer = new byte[1024 * 8];
//		while (true) {
//			int count = in.read(buffer); // 버퍼에 읽어들인 문자개수
//			if (count == -1) // 버퍼의 마지막에 도달했는지 체크
//				break;
//			out.write(buffer, 0, count);
//		}
//		in.close();
//		out.close();
//	}
	
	
	// 폴더에 썸네일 이미지 파일 생성 안 됨
	@RequestMapping("/download")
	public void download(@RequestParam("imageFileName") String imageFileName,// 다운로드할 이미지 파일 이름을 전달
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
		File image = new File(filePath);	// 다운로드할 파일객체 생성
		
		int lastIndex = imageFileName.lastIndexOf(".");
		System.out.println(">>>>>>>>lastIndex : " + lastIndex );
		if(lastIndex != -1) {
			String fileName = imageFileName.substring(0,lastIndex);
		
			File thumbnail = new File(CURR_IMAGE_REPO_PATH+ "\\" + "thumbnail" + "\\" + fileName + ".png");
			if(image.exists()) {
				Thumbnails.of(image).size(200,200).outputFormat("png").toOutputStream(out); //원본 이미지에 대한 썸네일 이미지를 생성한 후 OutputStream 객체에 할당
			}else {
				return;
			}
			byte[] buffer = new byte[1024 * 8]; //썸네일 이미지를 OutputStream 객체를 이용해 브라우저로 전송
				out.write(buffer);
			out.close();
		}
	}
}