package osf.spring.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import osf.spring.dto.DailyLookCommentsDTO;
import osf.spring.dto.DailyLookDTO;
import osf.spring.dto.MemberDTO;
import osf.spring.service.DailyLookCommentsService;
import osf.spring.service.DailyLookService;

@Controller
@RequestMapping("/daily/")
public class DailyLookController {
	
	@Autowired
	private DailyLookService dservice;

	@Autowired
	private DailyLookCommentsService dcservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("daily_list")
	public String select(Model model, int page)throws Exception{
		List<DailyLookDTO> list = dservice.select(page);
		String navi = dservice.getPageNavi(page);
		

		String id = session.getAttribute("loginid").toString();
		
		model.addAttribute("id",id);
		model.addAttribute("list",list);
		model.addAttribute("navi",navi);
		model.addAttribute("page",page);


		return "daily/daily_list";
	}
	
	@RequestMapping("view")
	public String view(DailyLookDTO ddto, DailyLookCommentsDTO cdto, Model model, HttpServletRequest request)throws Exception{
		
		DailyLookDTO result = dservice.selectOne(ddto);
		int page = Integer.parseInt(request.getParameter("page"));
		
		String id = session.getAttribute("loginid").toString();
		
		List<DailyLookCommentsDTO> list = dcservice.select(cdto);
		
		model.addAttribute("page",page);
		model.addAttribute("result",result);
		model.addAttribute("id",id);
		model.addAttribute("list",list);
		return "daily/view";
	}
	
	@RequestMapping("write")
	public String write() throws Exception{
		return "daily/write";
	}
	
	@RequestMapping("writeProc")
	public String insert(DailyLookDTO ddto,MultipartFile file)throws Exception{
		
		MemberDTO id = (MemberDTO) session.getAttribute("loginInfo");
		ddto.setWriter(id.getId());
		
			String filePath = session.getServletContext().getRealPath("OSF/"+ddto.getWriter() +"/");
				if(!file.isEmpty()) {
					File tempFilePath = new File(filePath);
					if(!tempFilePath.exists()) {
						tempFilePath.mkdirs();
					}
					
					String sysname = System.currentTimeMillis() + "_" + file.getOriginalFilename();
					File targetLoc = new File(filePath + "/" + sysname);
					file.transferTo(targetLoc);
					
					ddto.setSysname(sysname);
					ddto.setOriname(file.getOriginalFilename());
					
					System.out.println(filePath);
					
					dservice.insert(ddto);
				}
		
		
		return "redirect:/daily/daily_list?page=1";
	}
	
	@RequestMapping("osfdeltedailylook")
	public String delete(DailyLookDTO ddto)throws Exception{
		dservice.delete(ddto);
		return "redirect:/daily/daily_list?page=1";
	}
	
	@RequestMapping("modify")
	public String modify(DailyLookDTO ddto, Model model) throws Exception{
		model.addAttribute("result",ddto);
		return "daily/modify";
	}
	
	@RequestMapping("modifyProc")
	public String modifyProc(DailyLookDTO ddto,MultipartFile file) throws Exception{
		
		MemberDTO id = (MemberDTO) session.getAttribute("loginInfo");
		ddto.setWriter(id.getId());
		
		String filePath = session.getServletContext().getRealPath("OSF/"+ddto.getWriter() +"/");
		if(!file.isEmpty()) {
			File tempFilePath = new File(filePath);
			if(!tempFilePath.exists()) {
				tempFilePath.mkdirs();
			}
			
			String sysname = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			File targetLoc = new File(filePath + "/" + sysname);
			file.transferTo(targetLoc);
			
			ddto.setSysname(sysname);
			ddto.setOriname(file.getOriginalFilename());
			
			System.out.println(filePath);
			
			dservice.update(ddto);
		}
		return "redirect:/daily/daily_list?page=1";
	}
	
}
