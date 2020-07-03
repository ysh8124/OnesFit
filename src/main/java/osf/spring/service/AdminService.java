package osf.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import osf.spring.dao.AdminDAO;
import osf.spring.dto.MemberDTO;
import osf.spring.dto.OptionDTO;
import osf.spring.dto.ProductDTO;
import osf.spring.dto.ProductImgDTO;

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
	
}
