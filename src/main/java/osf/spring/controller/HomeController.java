package osf.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import osf.spring.dto.MemberDTO;
import osf.spring.dto.PopupDTO;
import osf.spring.dto.ProductDTO;
import osf.spring.service.AdminService;
import osf.spring.service.ProductService;

@Controller
public class HomeController {

	@Autowired
	HttpSession session;

	@Autowired
	private ProductService pservice;
	
	@Autowired
	private AdminService aservice;

	@RequestMapping("/")
	public String home(Model model, String tab2) {
		List<ProductDTO> products = pservice.productSelectAll();

		if (session.getAttribute("loginInfo") == null) {
			session.invalidate();
			String a = "pzlogin";
			session.setAttribute("loginInfo", a);
			System.out.println(session.getAttribute("loginInfo"));
		}

		if (session.getAttribute("loginid") == null) {
			session.invalidate();
			session.setAttribute("loginid", "pzlogin");
			System.out.println("loginid : " + session.getAttribute("loginid"));
		}

		List<ProductDTO> color = pservice.color();
		model.addAttribute("color", color);
		model.addAttribute("products", products);
		if (!"".equals(tab2)) {
			model.addAttribute("tab2", tab2);
		} else {
			tab2 = "";
			model.addAttribute("tab2", tab2);
		}
		return "index";
	}

	@RequestMapping("notice")
	public String notice() {
		return "notice/notice_list?page=1";
	}

	// mainPopupShow

	@RequestMapping("cookie")
	@ResponseBody
	public List<PopupDTO> popupCookie() {
		return aservice.selectPopupByY();
	}

	@RequestMapping("notice_popup")
	public String notice_popup(Model model, String sysfileName) {
		model.addAttribute("sysfileName", sysfileName);
		return "admin/notice_popup";
	}

}
