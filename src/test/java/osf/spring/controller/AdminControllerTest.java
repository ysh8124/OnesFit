package osf.spring.controller;

import java.util.Date;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import osf.spring.dto.MemberDTO;



@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class AdminControllerTest {
	private static final Logger logger = LoggerFactory.getLogger("AdminControllerTest.class");

	@Autowired
	private WebApplicationContext wac;
	private MockMvc mockMvc;
	protected MockHttpSession session;
	protected MockHttpServletRequest request;

	@Before
	public void setup() {
	      MemberDTO mdto = new MemberDTO();
	      //0,"ysh8124","123123","kyc","010","14550","부천시","우리집","kh@kh",0,"n",,
	      mdto.setId("ysh8124");
	      session = new MockHttpSession();
	      session.setAttribute("loginInfo", mdto);
	      session.setAttribute("loginid", "ysh8124");

	      request = new MockHttpServletRequest();
	      request.setSession(session);
	      this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();

		logger.info("setup()완료");
	}
	

	
	@Test
	public void orderListTest() {
		logger.info("===== orderListTest() 메소드 시작 =====");
		try {
		mockMvc.perform(MockMvcRequestBuilders.post("/member/orderList").session(session)).andDo(MockMvcResultHandlers.print()).
		andExpect(MockMvcResultMatchers.status().is(200));
		logger.info("=======orderListTest()  성공!!=======");
		}catch(Exception e) {
			logger.info(">>>orderListTest() 테스트 수행 실패:"+e.getMessage());
		}
	}
	
	@Test
	public void orderCancelTest() {
		logger.info("===== orderCancelTest() 메소드 시작 =====");
		try {
		mockMvc.perform(MockMvcRequestBuilders.post("/member/orderCancel").
				param("bseq", "10012").
				param("amount","30000").
				param("oseq","9")).andDo(MockMvcResultHandlers.print()).
		andExpect(MockMvcResultMatchers.status().is(302));
		
		logger.info("=======orderCancelTest()  성공!!=======");
		}catch(Exception e) {
			logger.info(">>>orderCancelTest() 테스트 수행 실패:"+e.getMessage());
		}

	}
	
	@Test
	public void tomyPageTest() {
		logger.info("===== tomyPageTest() 메소드 시작 =====");
		try {
		mockMvc.perform(MockMvcRequestBuilders.post("/member/tomyPage").session(session).param("id","ysh8124")).andDo(MockMvcResultHandlers.print()).
		andExpect(MockMvcResultMatchers.status().isOk());
		logger.info("=======tomyPageTest()  성공!!=======");
		}catch(Exception e) {
			logger.info(">>>tomyPageTest() 테스트 수행 실패:"+e.getMessage());
		}
	}

	@Test
	public void memberBlackTest() {
		logger.info("===== memberBlack() 메소드 시작 =====");
		try {
		mockMvc.perform(MockMvcRequestBuilders.post("/admin/memberBlack").
				param("id", "ysh8124")).andDo(MockMvcResultHandlers.print()).
		andExpect(MockMvcResultMatchers.status().is(302));
		logger.info("=======memberBlack()  성공!!=======");
		
		}catch(Exception e) {
			logger.info(">>>memberBlack() 테스트 수행 실패:"+e.getMessage());
		}
	}
	
	
	@Test
	public void productAddTest() {
		logger.info("===== productAddTest() 메소드 시작 =====");
		try {
			String[] color = {"black"};
			String[] count = {"2"};
		mockMvc.perform(MockMvcRequestBuilders.post("/admin/productAddProc").
				param("pname", "반팔셔츠").
				param("price","31000").
				param("content","설명이다").
				param("category","top").
				param("color",color).
				param("count",count).
				param("black","M")).andDo(MockMvcResultHandlers.print()).
				andExpect(MockMvcResultMatchers.status().is(302));
		logger.info("=======productAddTest()  성공!!=======");
		}catch(Exception e) {
			logger.info(">>>productAddTest() 테스트 수행 실패:"+e.getMessage());
		}
	}

}


