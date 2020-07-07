package osf.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import osf.spring.dao.ProductDAO;
import osf.spring.dto.BuyListDTO;
import osf.spring.dto.CartDTO;
import osf.spring.dto.ImageDTO;
import osf.spring.dto.OptionDTO;
import osf.spring.dto.ProductDTO;
import osf.spring.dto.ReviewDTO;

@Service
public class ProductService {

	@Autowired
	private ProductDAO pdao;

	@Transactional("txManager")
	public void productRegist(ProductDTO pdto,List<ImageDTO> imageList) {
		int seq=pdao.getNextVal();
		pdto.setPseq(seq);
		pdao.productRegist(pdto);
		for(ImageDTO dto : imageList) {
			dto.setProduct_seq(seq);
			pdao.imageRegist(dto);
		}
	}

	public List<ProductDTO> productSelectAll(){
		return pdao.productSelectAll();
	}

	public ProductDTO productSelectByPseq(int pseq) {
		return pdao.productSelectByPseq(pseq);
	}
	public List<ImageDTO> ImageSelectByPseq(int pseq) {
		return pdao.imageSelectByPseq(pseq);
	}
	public int cartAdd(List<CartDTO> carts) {
		int result=0;
		for(CartDTO cdto:carts) {
			result =pdao.cartAdd(cdto);
		}
		return result;
	}
	public List<OptionDTO> optionSelect(int pseq){
		return pdao.optionSelect(pseq);
	}
	public List<OptionDTO> colorSelect(int pseq,String color){
		return pdao.colorSelect(pseq,color);
	}
	public int BuyList(BuyListDTO bdto) {
		return pdao.buyList(bdto);
	}
	public List<ReviewDTO> ReviewtByPseq(int pseq) {
		return pdao.ReviewtByPseq(pseq);
	}
	public int Review(ReviewDTO rdto) {
		return pdao.review(rdto);
	}
}
