package osf.spring.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import osf.spring.dto.MemberDTO;
import osf.spring.dto.ProductDTO;
import osf.spring.dto.ProductImgDTO;
import osf.spring.service.MemberService;
import osf.spring.service.ProductService;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	public String filesUpload2(MultipartFile file,int seq) throws Exception {       
		 String filePath = session.getServletContext().getRealPath("upload");
		 
		String sysname = "";
		 File tempFilePath = new File(filePath);
		 
	      if(!tempFilePath.exists()) {
	    	  tempFilePath.mkdir();
	    	  filePath += "/product";
	    	   File temp2 = new File(filePath);
	    	   if(!temp2.exists()) {
	 	    	  temp2.mkdir();
	 	    	  filePath += "/title";
	 	    	  File temp3 = new File(filePath);
	 	    	 if(!temp3.exists()) {
	 		    	  temp3.mkdir();
	 		      }
	 	      }
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
		 String filePath = session.getServletContext().getRealPath("upload");
		 
		 List<ProductImgDTO> pdto=new ArrayList<>();
		 File tempFilePath = new File(filePath);
		 if(!tempFilePath.exists()) {
	    	  tempFilePath.mkdir();
	    	  filePath += "/product";
	    	   File temp2 = new File(filePath);
	    	   if(!temp2.exists()) {
	 	    	  temp2.mkdir();
	 	    	  filePath += "/"+seq;
	 	    	  File temp3 = new File(filePath);
	 	    	 if(!temp3.exists()) {
	 		    	  temp3.mkdir();
	 		      }
	 	      }
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
	private MemberService mservice;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("adminMain")
	public String goAdminMain() {
		return "/admin/adminMain";
	}
	
	@RequestMapping("productAdmin")
	public String goProductAdmin(Model model) {
		List<ProductDTO> pdto= pservice.getProduct();
		System.out.println(pdto.size());
		model.addAttribute("pdto",pdto);

		return "/admin/productAdmin";
	}
	
	@RequestMapping("toModify")
	public String goProductModify(HttpServletRequest request,Model model) {
		int pseq = Integer.parseInt(request.getParameter("pseq"));
		ProductDTO pdto = pservice.productDetail(pseq);
		model.addAttribute("pdto",pdto);
		return "/admin/productModify";
	}
	
	@RequestMapping("productAdd")
	public String goProductAdd() {
		return "/admin/productAdd";
	}
	
	@RequestMapping("memberAdmin")
	public String goMembers(Model model) {
		List<MemberDTO> mdto = mservice.getMembers();
		model.addAttribute("mdto",mdto);
		System.out.println(mdto.size());
		return "/admin/memberAdmin";
	}
	
	
	
	@RequestMapping("productAddProc")
	public String productAdd(@RequestParam Map<String,String[]> param,HttpServletRequest request,MultipartFile[] files,MultipartFile file) throws Exception{
		request.setCharacterEncoding("utf-8");
		String pname = request.getParameter("pname");
		int price = Integer.parseInt(request.getParameter("price"));
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String[] arr = request.getParameterValues("arr");
		System.out.println(arr.length);
		
		int seq = pservice.getProductSequence();

		
//		pservice.addOption(size,color);
		String sysname = this.filesUpload2(file, seq);
		List<ProductImgDTO> pdto = this.filesUpload(files,seq);
		pservice.addImg(pdto,seq);
		
		pservice.productAdd(pname,price,content,category,sysname);
		return "/admin/adminMain";
	}
	
}
