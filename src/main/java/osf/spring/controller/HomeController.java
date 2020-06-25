package osf.spring.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	@RequestMapping("productAdd")
	public String home() {
		
		return "/admin/productAdd";
	}
	
	@RequestMapping("adminMain")
	public String goAdmin() {
		return "/admin/adminMain";
	}
	
	@RequestMapping("productAdmin")
	public String productAdmin() {
		return "/admin/productAdmin";
	}
	
	
}
