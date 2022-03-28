package com.community.shy.board.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.community.shy.board.JobBoard.service.IBoardService;
import com.community.shy.board.command.BoardVO;
import com.community.shy.board.command.ImgVO;
import com.community.shy.board.util.PageCreator;
import com.community.shy.board.util.PageVO;
import com.community.shy.img.service.IimgService;
import com.community.shy.user.UserVO;

@Controller
public class ImageController {
	
	@Autowired
	private IBoardService service;
	
	@Autowired
	private IimgService imgService;

	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(int board_no, int board_type, String user_id) {
	
		BoardVO board = service.JBoardDetail(board_no, board_type, user_id);
		
		String img_path = board.getBoard_img() + "/" + board.getBoard_img_path();
		
		File file = new File(img_path);
		System.out.println(img_path);
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return result;
		
	}
	
	@PostMapping("/getImgUrl")
	@ResponseBody
	public String getImgUrl(@RequestParam("img_file") MultipartFile file, HttpServletRequest requeset) {
		String imgUrl = "";
		try { 
			// 날짜별로 폴더를 생성해서 파일을 관리 
			SimpleDateFormat sdf = new  SimpleDateFormat("yyyyMMdd"); 
			Date date = new Date();
			String fileLoca = sdf.format(date);
			String uploadPath = "C:\\test\\" +fileLoca; 
			String fileRealName = file.getOriginalFilename();
			File folder = new  File(uploadPath); 
			if(!folder.exists()) {
				folder.mkdir();//폴더가 존재하지 않는다면 생성해라 
			}

			UUID uuid = UUID.randomUUID(); 
			String uuids = uuid.toString().replaceAll("-", ""); 
		
			//확장자를 추출합니다. 
			String fileExtentsion = fileRealName.substring(fileRealName.indexOf("."),fileRealName.length());


			String fileName = uuids + fileExtentsion;

			// 업로드한 파일을 서버 컴퓨터의 지정한 경로 내에 실제로 저장. 
			String file_path = uploadPath +"\\" + fileName;
			
			ImgVO img = imgService.getImgNo();
			
			img.setPath(file_path);
			
			imgService.insertImg(img);
	
			
			System.out.println(file_path);
			File saveFile = new File(uploadPath +"\\" + fileName); 
			file.transferTo(saveFile);
			
			imgUrl = requeset.getContextPath()+"/getImg?img_no=" + img.getImg_no();
			
		} catch (Exception e) { 
			System.out.println("업로드 중 에러 발생 : " + e.getMessage());
		}
		
		return imgUrl; 
	}
	
	@GetMapping("/getImg")
	public ResponseEntity<byte[]> getImg(int img_no) {
	
		ImgVO img = imgService.getimg(img_no);
		
		System.out.println(img);
		
		String img_path = img.getPath();
		
		File file = new File(img_path);

		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return result;
		
	}
}