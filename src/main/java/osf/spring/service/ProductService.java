package osf.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import osf.spring.dao.ProductDAO;
import osf.spring.dto.ProductImgDTO;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO pdao;

	public int productAdd(String pname,int price,String content,String category,String sysname) {
		return pdao.productAdd(pname, price, content, category,sysname);
	}
	
	public int getProductSequence() {
		return pdao.getProductSequence();
	}
	
	public void addImg(List<ProductImgDTO> pdto,int seq) {
		pdao.addImg(pdto,seq);
	}
	
}
