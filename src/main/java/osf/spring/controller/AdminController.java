package osf.spring.controller;

import java.io.File;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import osf.spring.dto.MemberDTO;
import osf.spring.dto.OptionDTO;
import osf.spring.dto.ProductDTO;
import osf.spring.dto.ProductImgDTO;
import osf.spring.service.MemberService;
import osf.spring.service.ProductService;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	public void deleteFile2(int seq,String title_img) {
		String filePath = session.getServletContext().getRealPath("upload/product/title");
		File folder = new File(filePath);

		File[] folder_list = folder.listFiles(); //파일리스트 얻어오기

		for (int j = 0; j < folder_list.length; j++) {
			if(folder_list[j].equals(title_img)) {
			folder_list[j].delete(); //파일 삭제 
			System.out.println("대표이미지 삭제.");
			}
		}

	}

	public void deleteFile(int seq) {
		String filePath = session.getServletContext().getRealPath("upload/product/"+seq);
		File folder = new File(filePath);

		File[] folder_list = folder.listFiles(); //파일리스트 얻어오기

		for (int j = 0; j < folder_list.length; j++) {
			folder_list[j].delete(); //파일 삭제 
			System.out.println("파일이 삭제되었습니다.");

		}

	}

	public String filesUpload2(MultipartFile file,int seq) throws Exception {       
		String filePath = session.getServletContext().getRealPath("upload");

		String sysname = "";
		File tempFilePath = new File(filePath);
		System.out.println("filePath: "+filePath);
		System.out.println("tempFilePath : "+tempFilePath);
		if(!tempFilePath.exists()) {
			tempFilePath.mkdir();
		}
		filePath += "/product";
		File temp2 = new File(filePath);
		if(!temp2.exists()) {
			System.out.println(temp2);
			temp2.mkdir();
		}
		filePath += "/title";
		File temp3 = new File(filePath);
		if(!temp3.exists()) {
			System.out.println(temp3);
		}
		temp3.mkdir();
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

	@RequestMapping("productModify")
	public String goProductModify(HttpServletRequest request,Model model) {
		int pseq = Integer.parseInt(request.getParameter("pseq"));
		ProductDTO pdto = pservice.productDetail(pseq);
		List<String> img = pservice.getImg(pseq);
		List<OptionDTO> odto = pservice.getOption(pseq);
		model.addAttribute("pdto",pdto);
		model.addAttribute("img",img);
		model.addAttribute("odto",odto);
		return "/admin/productModify";
	}

	@RequestMapping("productModifyProc")
	public String productModify(HttpServletRequest request,MultipartFile[] files,MultipartFile file) throws Exception{
		request.setCharacterEncoding("utf-8");
		String pname = request.getParameter("pname");
		int price = Integer.parseInt(request.getParameter("price"));
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String[] colors = request.getParameterValues("color");
		Map<String,String[]> map = new HashMap<>();

		String[] count = null;
		for(int i=0;i<colors.length;i++) {
			count = request.getParameterValues("count");
			String color = colors[i];
			String[] list = request.getParameterValues(color);
			map.put(color, list);
			System.out.println(count[i]);
		}

		int seq = Integer.parseInt(request.getParameter("pseq"));
		System.out.println("상품번호 : "+seq);
		String title_img = request.getParameter("title_img");
		String sysname="";
		System.out.println(file.getSize());
		System.out.println(files.length);
		if(!file.isEmpty()) {
			this.deleteFile2(seq,title_img);
			sysname = this.filesUpload2(file, seq);
		}else {sysname = title_img;}
		if(files.length > 0) {
			this.deleteFile(seq);
			List<ProductImgDTO> pdto = this.filesUpload(files,seq);
			pservice.modifyImg(pdto,seq);
		}

		int result = pservice.productModify(seq,pname,price,content,category,sysname);
		if(result > 0) {
			List<OptionDTO> odto = new ArrayList<>();
			int index=0;
			for(String key : map.keySet()) {
				String[] list = map.get(key);

				for(int i=0;i<list.length;i++) {
					System.out.println(key);
					System.out.println(list[i]);
					odto.add(new OptionDTO(seq,key,list[i],Integer.parseInt(count[index])));
				}
				index++;
			}
			pservice.modifyOption(odto,seq);
		}
		return "redirect:/admin/adminMain";
	}


	@RequestMapping("productAdd")
	public String goProductAdd() {
		return "/admin/productAdd";
	}

	@RequestMapping("memberAdmin")
	public String goMembers(Model model) throws Exception{
		List<MemberDTO> mdto = mservice.getMembers();

		model.addAttribute("mdto",mdto);
		System.out.println(mdto.size());
		return "/admin/memberAdmin";
	}



	@RequestMapping("productAddProc")
	public String productAdd(HttpServletRequest request,MultipartFile[] files,MultipartFile file) throws Exception{
		request.setCharacterEncoding("utf-8");
		String pname = request.getParameter("pname");
		int price = Integer.parseInt(request.getParameter("price"));
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String[] colors = request.getParameterValues("color");
		Map<String,String[]> map = new HashMap<>();
		System.out.println("색상 개수는 : " + colors.length);
		String[] count = null;
		for(int i=0;i<colors.length;i++) {
			count = request.getParameterValues("count");
			String color = colors[i];
			String[] list = request.getParameterValues(color);
			map.put(color, list);
			System.out.println(count[i]);
		}

		int seq = pservice.getProductSequence();


		String sysname = this.filesUpload2(file, seq);
		List<ProductImgDTO> pdto = this.filesUpload(files,seq);
		pservice.addImg(pdto,seq);

		int result = pservice.productAdd(pname,price,content,category,sysname);
		if(result > 0) {
			List<OptionDTO> odto = new ArrayList<>();
			int index=0;
			for(String key : map.keySet()) {
				String[] list = map.get(key);

				for(int i=0;i<list.length;i++) {
					System.out.println(key);
					System.out.println(list[i]);
					System.out.println(count[index]);
					odto.add(new OptionDTO(seq,key,list[i],Integer.parseInt(count[index])));
				}
				index++;
			}
			pservice.addOption(odto);
		}
		return "/admin/adminMain";

	}

	@RequestMapping("productDelete")
	public String productDelete(int pseq) {
		int result = pservice.productDelete(pseq);
		if(result>0) {
			return "redirect:/admin/productAdmin";
		}
		return "error";
	}

	@RequestMapping("memberDelete")
	public String memberDelete(String id) {
		System.out.println(id);
		mservice.memberDelete(id);
		return "redirect:/admin/memberAdmin";
	}

	@RequestMapping("memberBlack")
	public String memberBlack(String id) {
		System.out.println(id);
		mservice.memberBlack(id);
		return "/admin/memberAdmin";
	}

	@RequestMapping("updatePoint")
	@ResponseBody
	public Object updatePoint(String id,int point) {
		System.out.println(id+"/"+point);
		int result = mservice.updatePoint(id,point);
		return result;
	}
}
