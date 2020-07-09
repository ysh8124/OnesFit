package osf.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import osf.spring.dto.BuyListDTO;
import osf.spring.dto.CartDTO;
import osf.spring.dto.ImageDTO;
import osf.spring.dto.OptionDTO;
import osf.spring.dto.OrderDTO;
import osf.spring.dto.ProductDTO;
import osf.spring.dto.QuestionDTO;
import osf.spring.dto.ReviewDTO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int getNextVal() {
		return mybatis.selectOne("Product.product_nextval");		
	}
	public int getOrderNextVal() {
		return mybatis.selectOne("Product.order_nextval");		
	}

	public void productRegist(ProductDTO dto) {
		mybatis.update("Product.productRegist",dto);
	}

	public void imageRegist(ImageDTO dto) {
		mybatis.update("Product.imageRegist",dto);
	}

	public List<ProductDTO> productSelectAll(){
		return mybatis.selectList("Product.productSelect");
	}

	public ProductDTO productSelectByPseq(int pseq) {
		return mybatis.selectOne("Product.productSelectByPseq", pseq);
	}
	public List<ImageDTO> imageSelectByPseq(int pseq) {
		return mybatis.selectList("Product.imageSelectByPseq", pseq);
	}

	public int cartAdd(CartDTO cdto) {
		return mybatis.update("Product.cartAdd",cdto);
	}

	public List<OptionDTO> optionSelect(int pseq){		
		return mybatis.selectList("Product.optionSelect",pseq);
	}
	public List<OptionDTO> colorSelect(int pseq,String color){
		Map<String,Object> param = new HashMap<>();
		param.put("pseq", pseq);
		param.put("color",color);
		return mybatis.selectList("Product.colorSelect",param);
	}
	public int buyList(BuyListDTO bdto) {
		return mybatis.insert("Product.buyList", bdto);
	}
	public int addPoint(BuyListDTO bdto) {
		return mybatis.insert("Product.addpoint", bdto);
	}
	public int orderInsert(OrderDTO odto) {
		return mybatis.insert("Product.orderInsert",odto);
	}
	public int usepoint(OrderDTO odto) {
		return mybatis.insert("Product.usepoint", odto);
	}
	public int selectPoint(String id) {
		return mybatis.selectOne("Product.selectPoint", id);
	}
	public int review(ReviewDTO rdto) {
		return mybatis.insert("Product.review", rdto);
	}
	public List<ReviewDTO> ReviewtByPseq(int pseq) {
		return mybatis.selectList("Product.reviewSelectByPseq", pseq);
	}	
	public int question(QuestionDTO qdto) {
		return mybatis.insert("Product.question", qdto);
	}
	public List<QuestionDTO> QuestioByPseq(int pseq) {
		return mybatis.selectList("Product.questionSelectByPseq", pseq);
	}
	public int reviewdelete(int bno) { 
		return mybatis.delete("Product.reviewDelete", bno); 
	}
	public int questiondelete(int bno) { 
		return mybatis.delete("Product.questiondelete", bno); 
	}
	public int reviewupdate(ReviewDTO rdto) {
		return mybatis.update("Product.reviewupdate", rdto);
	}
}
