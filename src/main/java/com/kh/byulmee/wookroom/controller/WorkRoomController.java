package com.kh.byulmee.wookroom.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.byulmee.activity.model.exception.ActivityException;
import com.kh.byulmee.activity.model.service.ActivityService;
import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.image.model.service.ImageService;
import com.kh.byulmee.image.model.vo.Image;

@Controller
public class WorkRoomController {
	
	@Autowired
	private ActivityService aService;
	
	@Autowired
	private ImageService iService;
	
	@RequestMapping("wookroomView.wr")
	public String wookRoomViewForm() {
		return "atWorkRoomMainAd";
	}
	
	@RequestMapping("activityInsertForm.wr")
	public String ActivityInsertForm() {
		return "activityInsert";
	}
	
	@RequestMapping("productView.wr")
	public String ProductViewForm() {
		return "pdWorkRoomMainAd";
	}
	
	@RequestMapping("productInsertForm.wr")
	public String ProductInsertForm() {
		return "productInsert";
	}
	
	@RequestMapping("ainsert.wr")
	public String ActivityInsert(@ModelAttribute Activity a, @RequestParam("thumbnailImg5") MultipartFile thumbnailImg5, 
									@RequestParam("thumbnailImg1") MultipartFile thumbnailImg1,
									@RequestParam("thumbnailImg2") MultipartFile thumbnailImg2, 
									@RequestParam("thumbnailImg3") MultipartFile thumbnailImg3, 
									@RequestParam("thumbnailImg4") MultipartFile thumbnailImg4,
									HttpServletRequest request) {
		System.out.println("thumbnailImg5 : " + thumbnailImg5);
		System.out.println("thumbnailImg1 : " + thumbnailImg1);
		System.out.println("thumbnailImg2 : " + thumbnailImg2);
		System.out.println("thumbnailImg3 : " + thumbnailImg3);
		System.out.println("thumbnailImg4 : " + thumbnailImg4);
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		int result5 = 0;
		int actNo = aService.insertActivity(a);
		
		Image ri = new Image();
		Image i = new Image();
		
		System.out.println(actNo);
		if(thumbnailImg5 != null && !thumbnailImg5.isEmpty()) {
			
			ri = saveFile(thumbnailImg5, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg5.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(Integer.toString(actNo));
				i.setImgPath(imgPath);
				i.setImgLevel(0);
			}
			
			result1 = iService.insertImage(i);
		}
		
		if(thumbnailImg1 != null && !thumbnailImg1.isEmpty()) {
			
			ri = saveFile(thumbnailImg1, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg1.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(Integer.toString(actNo));
				i.setImgPath(imgPath);
				i.setImgLevel(1);
			}
			
			result2 = iService.insertImage(i);
		}
		
		if(thumbnailImg2 != null && !thumbnailImg2.isEmpty()) {
			
			ri = saveFile(thumbnailImg2, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg2.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(Integer.toString(actNo));
				i.setImgPath(imgPath);
				i.setImgLevel(1);
			}
			
			result3 = iService.insertImage(i);
		}
		
		if(thumbnailImg3 != null && !thumbnailImg3.isEmpty()) {
			
			ri = saveFile(thumbnailImg3, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg3.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(Integer.toString(actNo));
				i.setImgPath(imgPath);
				i.setImgLevel(1);
			}
			
			result4 = iService.insertImage(i);
		}
		
		if(thumbnailImg4 != null && !thumbnailImg4.isEmpty()) {
			
			ri = saveFile(thumbnailImg4, request);
			
			String imgName = ri.getImgName();
			String imgPath = ri.getImgPath();
			
			if(imgName != null) {
				i.setImgName(imgName);
				i.setImgOrigin(thumbnailImg4.getOriginalFilename());
				i.setImgRefcode(1);
				i.setImgRefno(Integer.toString(actNo));
				i.setImgPath(imgPath);
				i.setImgLevel(1);
			}
			
			result5 = iService.insertImage(i);
		}
		
		System.out.println(actNo + ", " + result1 + ", " + result2 + ", " + result3 + ", " + result4 + ", " + result5);
		
		if(actNo > 0 && result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0 ) {
			return "redirect:wookroomView.wr";
		} else {
			throw new ActivityException("활동상품 등록에 실패했습니다.");
		}
		
	}
	
	public Image saveFile(MultipartFile file, HttpServletRequest request) {
		Image i = new Image();
		//"C:\\dev\\Final_byulmee\\byulmee\\src\\main\\webapp\\resources";
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 웹 서버 contextPath를 불러와 폴더의 경로 받아옴(webapp 하위의 resources 폴더 )
		System.out.println(root);
		String savePath = root + "\\auploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		int ranNum = (int)(Math.random()*100000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum 
								+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "\\" + renameFileName;
		i.setImgPath(renamePath);
		i.setImgName(renameFileName);
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// DB에 저장할 용도로 리턴하는 값
		return i;
	}
	
	
}
