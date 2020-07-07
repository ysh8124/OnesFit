package osf.spring.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import osf.spring.dao.AdminDAO;
import osf.spring.dto.BestProductDTO;
import osf.spring.dto.BuyListDTO;
import osf.spring.dto.MemberDTO;
import osf.spring.dto.OptionDTO;
import osf.spring.dto.ProductDTO;
import osf.spring.dto.ProductImgDTO;
import osf.spring.dto.QuestionDTO;
import osf.spring.statics.Statics;

@Service
public class AdminService {
	
	
	@Autowired
	private AdminDAO adao;
	
	
	public List<Integer> getSales() {
		return adao.getSales();
	}
	
	public int totalSale() {
		return adao.totalSale();
	}
	
	public List<MemberDTO> getMembers(){
		return adao.getMembers();
	}
	
	public int memberDelete(String id) {
		return adao.memberDelete(id);
	}
	
	public int memberBlack(String id) {
		return adao.memberBlack(id);
	}
	
	public void unBlack(String id) {
		adao.unBlack(id);	
	}
	
	public int updatePoint(String id,int point) {
		return adao.updatePoint(id,point);
	}
	
	public List<ProductDTO> getProduct(){
		return adao.getProduct();
	}

	public int productAdd(String pname,int price,String content,String category,String sysname) {
		return adao.productAdd(pname, price, content, category,sysname);
	}


	public int getProductSequence() {
		return adao.getProductSequence();
	}

	public void addImg(List<ProductImgDTO> pdto,int seq) {
		adao.addImg(pdto,seq);
	}

	public ProductDTO productDetail(int pseq) {
		return adao.productDetail(pseq);
	}

	public int addOption(List<OptionDTO> odto) throws InterruptedException {
		int result = 0;
		for(int i=0;i<odto.size();i++) {
			adao.addOption(odto.get(i));
		}
		return result;
	}
	
	public int productDelete(int seq) {
		return adao.productDelete(seq);
	}
	
	public List<String> getImg(int pseq) {
		return adao.getImg(pseq);
	}

	public void modifyImg(List<ProductImgDTO> pdto, int seq) {	
		adao.modifyImg(pdto,seq);
	}

	public void modifyOption(List<OptionDTO> odto,int seq) throws InterruptedException {
		adao.deleteOption(seq);
		for(int i=0;i<odto.size();i++) {
			adao.addOption(odto.get(i));
		}
	}

	public int productModify(int pseq,String pname, int price, String content, String category, String sysname) {
		return adao.productModify(pseq,pname,price,content,category,sysname);
	}

	public List<OptionDTO> getOption(int pseq) {
		return adao.getOption(pseq);
	}
	
	public List<BestProductDTO> itemRank(){
		
		return adao.itemRank();
	}
	
	public List<ProductDTO> bestProduct(List<BestProductDTO> best){
		List<ProductDTO> bestList = new ArrayList<>();
		for(BestProductDTO b : best) {
			bestList.add(adao.bestProduct(b.getProduct_num()));
		}
		return bestList;
	}

	public void setBest(int[] pseq) {
		for(int i=0;i<pseq.length;i++) {
		  adao.setBest(pseq[i]);
		}
		
	}
	
	/////////////////////////영재씨파트///////////////////////
	//buylist
		public List<BuyListDTO> selectByPage(int page){
			return adao.selectByPageNo(page);
		}
		
		public String getPageNavi(int currentPage) throws Exception {
			int recordTotalCount = adao.getArticleCount();
			int pageTotalCount = 0;
			if(recordTotalCount % Statics.RECORD_COUNT_PER_PAGE > 0) {
				pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
			}else {
				pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			}
			if(currentPage < 1) {
				currentPage = 1;
			}else if(currentPage > pageTotalCount) {
				currentPage = pageTotalCount;
			}
			int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
			int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;
			if(endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			}
			boolean needPrev = true; // <
			boolean needNext = true; // >
			if(startNavi == 1) {needPrev = false;}
			if(endNavi == pageTotalCount) {needNext = false;}

			StringBuilder sb = new StringBuilder();	
			if(needPrev) {sb.append("<li class='page-item'><a class='page-link' href='buyList?page="+(startNavi-1)+"' tabindex='-1' aria-disabled='true'>< </a></li>");}
			for(int i = startNavi;i <= endNavi;i++) {
				sb.append("<li class='page-item'><a class='page-link' href='buyList?page="+i+"'>" + i + "</a></li>");
			}
			if(needNext) {sb.append("<li class='page-item'><a class='page-link' href='buyList?page="+(endNavi+1)+"'>></a></li>");}
			return sb.toString();
		}


		public Object updateWhenStatusN(Map<String, Object> updateParam) {
			return adao.updateWhenStatusN(updateParam);
			
		}

		public Object updateWhenStatusY0(Map<String, Object> updateParam) {
			return adao.updateWhenStatusY0(updateParam);
			
		}

		public Object updateWhenStatusYX(Map<String, Object> updateParam) {
			return adao.updateWhenStatusYX(updateParam);
			
		}

		
		//question
		public List<QuestionDTO> qSelectAll() {
			return adao.qSelectAll();
		}

		public String getQuestionPageNavi(int currentPage) {
			int recordTotalCount = adao.getQuestionArticleCount();
			int pageTotalCount = 0;
			if(recordTotalCount % Statics.RECORD_COUNT_PER_PAGE > 0) {
				pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;	
			}else {
				pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			}
			if(currentPage < 1) {
				currentPage = 1;
			}else if(currentPage > pageTotalCount) {
				currentPage = pageTotalCount;
			}
			int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
			int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;
			if(endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			}
			boolean needPrev = true; // <
			boolean needNext = true; // >
			if(startNavi == 1) {needPrev = false;}
			if(endNavi == pageTotalCount) {needNext = false;}

			StringBuilder sb = new StringBuilder();	
			if(needPrev) {sb.append("<li class='page-item'><a class='page-link' href='question?page="+(startNavi-1)+"' tabindex='-1' aria-disabled='true'>< </a></li>");}
			for(int i = startNavi;i <= endNavi;i++) {
				sb.append("<li class='page-item'><a class='page-link' href='question?page="+i+"'>" + i + "</a></li>");
			}
			if(needNext) {sb.append("<li class='page-item'><a class='page-link' href='question?page="+(endNavi+1)+"'>></a></li>");}
			return sb.toString();
		}

		public int answerInput(Map<String, Object> inputParam) {
			return adao.answerInput(inputParam);
			
		}

	
}
