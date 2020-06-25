package osf.spring.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import osf.spring.dto.ProductImgDTO;
import osf.spring.service.ProductService;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	public String filesUpload2(MultipartFile file,int seq) throws Exception {       
		 String filePath = session.getServletContext().getRealPath("upload/product/title");
		 
		String sysname = "";
		 File tempFilePath = new File(filePath);
	      if(!tempFilePath.exists()) {
	         tempFilePath.mkdir();
	      }
	      if(!file.isEmpty()) {
		    	 String systemFileName = file.getOriginalFilename();
		    	 File targetLoc = new File(filePath + "/" + systemFileName);
		    	 file.transferTo(targetLoc);
		    	 sysname = systemFileName;
		    	
		    	 }
	      return sysname;

	   }  
	
	public List<ProductImgDTO> filesUpload(MultipartFile[] files,int seq) throws Exception {       
		 String filePath = session.getServletContext().getRealPath("upload/product/"+seq);
		 System.out.println(filePath);
		 List<ProductImgDTO> pdto=new ArrayList<>();
		 File tempFilePath = new File(filePath);
	      if(!tempFilePath.exists()) {
	         tempFilePath.mkdir();
	      }
	      

	     for(MultipartFile file : files) {
	    	 if(!file.isEmpty()) {
	    	 String systemFileName = file.getOriginalFilename();
	    	 File targetLoc = new File(filePath + "/" + systemFileName);
	    	 file.transferTo(targetLoc);
	    	 pdto.add(new ProductImgDTO(0,file.getOriginalFilename(),systemFileName));
	    	 }
	     }return pdto;
	   }  
	
	@Autowired
	private ProductService pservice;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("adminMain")
	public String goAdminMain() {
		return "/admin/adminMain";
	}
	
	@RequestMapping("productAdmin")
	public String goProductAdmin() {
		return "/admin/productAdmin";
	}
	
	@RequestMapping("productAdd")
	public String goProductAdd() {
		return "/admin/productAdd";
	}
	
	
	
	@RequestMapping("productAddProc")
	public String productAdd(HttpServletRequest request,MultipartFile[] files,MultipartFile file) throws Exception{
		request.setCharacterEncoding("utf-8");
		String pname = request.getParameter("pname");
		int price = Integer.parseInt(request.getParameter("price"));
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		int seq = pservice.getProductSequence();
		String sysname = this.filesUpload2(file, seq);
		List<ProductImgDTO> pdto = this.filesUpload(files,seq);
		pservice.addImg(pdto,seq);
		
		pservice.productAdd(pname,price,content,category,sysname);
		return "redirect:/admin/adminMain";
	}
	
}
