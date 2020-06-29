package osf.spring.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import osf.spring.dto.ProductImgDTO;
import osf.spring.service.ProductService;

@Controller
@RequestMapping("/product/")
public class ProductController {
	
	
	@Autowired
	private ProductService pservice;
	
	@Autowired
	private HttpSession session;
	
	public String filesUpload2(MultipartFile file,int seq) throws Exception {       
		 String filePath = session.getServletContext().getRealPath("upload/product/title");
		 
		String sysname = "";
		 File tempFilePath = new File(filePath);
		 System.out.println(tempFilePath);
	      if(!tempFilePath.exists()) {
	         File temp1 = new File("D:\\Spring\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\OnesFit\\upload");
	         temp1.mkdir();
	         File temp2 = new File("D:\\Spring\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\OnesFit\\upload\\product");
	         temp2.mkdir();
	         File temp3 = new File("D:\\Spring\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\OnesFit\\upload\\product\\title");
	         temp3.mkdir();
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
	         File temp1 = new File("D:\\Spring\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\OnesFit\\upload");
	         if(!temp1.exists()) {
	         temp1.mkdir();
	         }
	         File temp2 = new File("D:\\Spring\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\OnesFit\\upload\\product");
	         if(!temp2.exists()) {
	         temp2.mkdir();
	         }
	         File temp3 = new File("D:\\Spring\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\OnesFit\\upload\\product\\"+seq);
	         if(!temp3.exists()) {
	         temp3.mkdir();
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
	
	@RequestMapping("productAdd")
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
