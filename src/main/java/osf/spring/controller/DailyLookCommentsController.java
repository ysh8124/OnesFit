package osf.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import osf.spring.dto.DailyLookCommentsDTO;
import osf.spring.service.DailyLookCommentsService;

@Controller
@RequestMapping("/comments/")
public class DailyLookCommentsController {
	
	@Autowired
	private DailyLookCommentsService dservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("comment")
	@ResponseBody
	public String insert(HttpServletRequest request, DailyLookCommentsDTO ddto, Model model) throws Exception{
		ddto.setD_seq(Integer.parseInt(request.getParameter("d_seq")));
		ddto.setWriter(request.getParameter("writer"));
		ddto.setContents(request.getParameter("contents"));
		
		int page = Integer.parseInt(request.getParameter("page"));
		model.addAttribute("page",page);

		dservice.insert(ddto);
		
		return "daily/view";
	}
	
	@RequestMapping("delete")
	public String delete(DailyLookCommentsDTO ddto,HttpServletRequest request) throws Exception{
		int page = Integer.parseInt(request.getParameter("page"));
		
		dservice.delete(ddto);
		return "redirect:/daily/view?d_seq="+ddto.getD_seq()+"&page="+page;
	}
}
