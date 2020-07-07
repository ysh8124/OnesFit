package osf.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import osf.spring.dto.NoticeBoardDTO;
import osf.spring.service.NoticeService;

@Controller
@RequestMapping("/notice/")
public class NoticeBoardController {
	
	@Autowired
	private NoticeService nservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("notice_list")
	public String select(Model model, int page)throws Exception{
		List<NoticeBoardDTO> list = nservice.select(page);
		String navi = nservice.getPageNavi(page);

		System.out.println(navi);
		String id = session.getAttribute("loginid").toString();

		
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		model.addAttribute("navi",navi);
		model.addAttribute("loginInfo2",id);

		return "notice/notice_list";
	}
	
	@RequestMapping("view")
	public String selectOne(NoticeBoardDTO ndto, Model model, HttpServletRequest request)throws Exception{
		NoticeBoardDTO result = nservice.selectOne(ndto);
		int page = Integer.parseInt(request.getParameter("page"));
		
		nservice.update(ndto);
		
		model.addAttribute("result",result);
		model.addAttribute("page",page);
		return "notice/view";
		
	}
	
	@RequestMapping("write")
	public String write()throws Exception{
		return "notice/write";
	}
	
	@RequestMapping("insert")
	public String insert(NoticeBoardDTO ndto) throws Exception{
		ndto.setWriter("관리자");
		ndto.setTitle(ndto.getTitle().replaceAll("<", "&lt"));

		nservice.insert(ndto);
		return "redirect:notice_list?page=1";
	}
	
	@RequestMapping("delete")
	public String delete(NoticeBoardDTO ndto)throws Exception{
		nservice.delete(ndto);
		return "redirect:notice_list?page=1";
	}
	
	@RequestMapping("modify")
	public String modify(NoticeBoardDTO ndto,Model model, HttpServletRequest request)throws Exception{	
		int page = Integer.parseInt(request.getParameter("page"));
		
		model.addAttribute("result",ndto);
		model.addAttribute("page",page);
		
		System.out.println(ndto.getContents());
		return "notice/modify";
	}
	
	@RequestMapping("modifyProc")
	public String modifyProc(NoticeBoardDTO ndto) throws Exception{
		ndto.setTitle(ndto.getTitle().replaceAll("<", "&lt"));
		nservice.modify(ndto);
		return "redirect:notice_list?page=1";
	}
}
