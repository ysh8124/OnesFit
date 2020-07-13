package osf.spring.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import osf.spring.dao.MemberDAO;
import osf.spring.dao.ProductDAO;
import osf.spring.dto.BuyListDTO;
import osf.spring.dto.CartDTO;
import osf.spring.dto.LocketListDTO;
import osf.spring.dto.MemberDTO;
import osf.spring.dto.OrderBillDTO;
import osf.spring.dto.ProductDTO;
import osf.spring.statics.Statics;

@Service
public class MemberService {
	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private ProductDAO pdao;
	
	@Autowired
	private HttpSession session;
	
	public static String getSHA512(String input){

		String toReturn = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-512");
			digest.reset();
			digest.update(input.getBytes("utf8"));
			toReturn = String.format("%0128x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return toReturn;
	}
	
	public boolean login(String id,String pw) {
		Map<String,String> param = new HashMap<>();
		param.put("id",id);
		param.put("pw",this.getSHA512(pw));
		boolean check = mdao.login(param);
		return check;
	}
	
	public MemberDTO mypage(String id){
		MemberDTO mdto = mdao.mypage(id);
		return mdto;
	}
	
	public List<CartDTO> cart(CartDTO cdto){
		return mdao.cart(cdto);
	}
	
	public int productDelete(CartDTO cdto) {
		return mdao.productDelete(cdto);
	}
	
	public int productDeleteAll(CartDTO cdto) {
		return mdao.productDeleteAll(cdto);
	}

	public void joinCount() {
		mdao.joinCount();
		
	}
	
	////////////영웅이형파트////////////
	public int addMember(MemberDTO mdto) throws Exception{
		mdto.setPw(getSHA512(mdto.getPw()));
		
		int result = mdao.addMember(mdto);
		return result;
	}
	public int locketwrite(LocketListDTO dto)throws Exception {
		
		String id = (String)session.getAttribute("loginid");
		dto.setId(id);
		int result = mdao.locketwrite(dto);
		
		return result;
	
	}
	
	public boolean isIdAble(String id) throws Exception{
		boolean result = mdao.isIdAble(id);
		return result;
	}
	
	public boolean isEmailAvailable(String email) throws Exception{
		boolean result = mdao.isEmailAvailable(email);
		return result;
	}
	

	public String doesIdExist(String name, String email) throws Exception{
		return mdao.findid(name,email);	
	}
	
	public String isMemberAvailable(String id, String email) throws Exception{
		return mdao.findpw(id,email);	
	}
	
	public MemberDTO profilego(String id) throws Exception{
		return mdao.profilego(id);	
	}
	
	
	public int updatePw(String pw, String id) throws Exception{
		String pw2 = this.getSHA512(pw);
		return mdao.updatePw(pw2,id);	
	}
	
	public int memberupdate(String id ,String name, String phone , String zipcode ,String address1, String address2, String email) throws Exception{
	
		/* String pw2 = this.getSHA512(pw); */
		
		return mdao.memberupdate(id,name,phone,zipcode,address1,address2,email);
		
	}
	
	public boolean pwcheck(String id,String pw) throws Exception {
		String pw2 = this.getSHA512(pw);
		System.out.println("아이디 나오나 : "+id);
		System.out.println(pw2);
		boolean result = mdao.pwcheck(id,pw2);
		return result;
	}
	
	public int leaveMember(String id) throws Exception{

		int result = mdao.leaveMember(id);
		return result;
	}
	
	
	
	public int delete(int seq) throws Exception{
		int result = mdao.delete(seq);
		return result;
	}
	
	public List<LocketListDTO> locketlist(int page) throws Exception{
		String id = (String)session.getAttribute("loginid");
		return mdao.locketlist(page,id);
	}

	
	public String getPageNavi(int currentPage) throws Exception{
	      int recordTotalCount = mdao.getArticleCount(); 
	      int pageTotalCount = 0; 
	      
	      if(recordTotalCount%Statics.RECORD_COUNT_PER_PAGE == 0) {
	         pageTotalCount = recordTotalCount /Statics.RECORD_COUNT_PER_PAGE;
	      }else {
	         pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE +1;   
	      }
	      
	      if(currentPage < 1) {
	         currentPage = 1;
	      }
	      else if(currentPage > pageTotalCount) {
	         currentPage = pageTotalCount;
	      }
	      
	      int startNavi = (currentPage -1) / Statics.NAVI_COUNT_PER_PAGE *Statics.NAVI_COUNT_PER_PAGE + 1;
	      int endNavi = startNavi +Statics.NAVI_COUNT_PER_PAGE - 1;
	      
	      if(endNavi > pageTotalCount) {
	         endNavi = pageTotalCount;
	      }
	      
	      boolean needPrev = true;
	      boolean needNext = true;
	      
	      StringBuilder sb = new StringBuilder();
	      
	      if(startNavi ==1) {
	         needPrev =false;
	      }
	      if(endNavi==pageTotalCount) {
	         needNext = false;
	      }
	      
	      if(needPrev) {
	         sb.append("<a href=\"/member/toLocketlist?page="+(startNavi-1)+"\">< </a>");
	      }
	      for(int i = startNavi; i<=endNavi; i++) {
	         sb.append("<a href=\"/member/toLocketlist?page="+i+"\">"+i+"</a>  ");   
	      }
	      if(needNext) {
	         sb.append("<a href=\"/member/toLocketlist?page="+(endNavi+1)+"\"> ></a>");
	      }
	      return sb.toString();
	   }

	public int getUseMoney(String id) {
		return mdao.getUseMoney(id);
		
	}

	public List<BuyListDTO> orderList(String id) {
		return mdao.orderList(id);
	}
	
	public OrderBillDTO getOrderBill(int oseq) {
		return mdao.getOrderBill(oseq);
	}

	public List<String> orderImg(List<Integer> pseq) {
		List<String> imgs = new ArrayList<>();
		for(Integer p : pseq) {
			imgs.add(mdao.orderImg(p));
		}
		return imgs;
	}
	public List<LocketListDTO> selectAddressList(String id){
		return mdao.selectAddressList(id);
	}

	@Transactional("txManager")
	public int orderCancel(int bseq,int amount,int oseq) {
		String id = (String)session.getAttribute("loginid");
		String YN = mdao.getYN(bseq);
		int result = 0;
		int usePoint = 0;
		int price = 0;
		if(YN.contentEquals("N")) {
			boolean buylistYN = mdao.buylistYN(oseq);
			usePoint = mdao.getUsePoint(oseq); // 사용포인트 가져오기
			if(usePoint != 0) {
				mdao.returnPoint(id,usePoint);//포인트 돌려주기	
				
			}
			if(buylistYN) {
				BuyListDTO bdto = mdao.getBuyList(bseq);
				int product_num = bdto.getProduct_num();
				ProductDTO pdto = pdao.productSelectByPseq(product_num);
				price = pdto.getPrice();
				result = mdao.minusBill(oseq,price);
			}else {
			mdao.billCancel(oseq);//빌지삭제
			}
			result = mdao.orderCancel(bseq);//바이리스트삭제
		}
		return result;
	}

	public List<String> myBuyList(String id) {
		return mdao.myBuyList(id);
	}

	@Transactional("txManager")
	public int onlyBuy(int bseq,int price) {
		String id = (String)session.getAttribute("loginid");
		int point = (int) (price * 0.02);
		mdao.addPoint(id,point);
		return mdao.onlyBuy(bseq);
	}
	
}
