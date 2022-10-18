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
	
	
	// 폴더에 섬네일 이미지 파일 생성 안 됨
	@RequestMapping("/download")
	public void download(@RequestParam("imageFileName") String imageFileName,
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
		File image = new File(filePath);
		
		int lastIndex = imageFileName.lastIndexOf(".");
		String fileName = imageFileName.substring(0,lastIndex);
		
		File thumbnail = new File(CURR_IMAGE_REPO_PATH+ "\\" + "thumbnail" + "\\" + fileName + ".png");
		if(image.exists()) {
			Thumbnails.of(image).size(200,200).outputFormat("png").toOutputStream(out);
		}else {
			return;
		}
		byte[] buffer = new byte[1024 * 8];
			out.write(buffer);
		out.close();
	}
}