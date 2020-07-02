package osf.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import osf.spring.dto.OptionDTO;
import osf.spring.dto.ProductDTO;
import osf.spring.dto.ProductImgDTO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<ProductDTO> getProduct(){
		return mybatis.selectList("product.getProduct");
	}

	public int productAdd(String pname,int price,String content, String category,String sysname) {
		Map<String,String> param = new HashMap();
		param.put("pname", pname);
		param.put("price", ""+price);
		param.put("content", content);
		param.put("category", category);
		param.put("img", sysname);
		return mybatis.insert("product.addProduct",param);	
	}

	//	public int addOption(String[] size,String[] color) {
	//		
	//	}

	public int getProductSequence() {
		int num;
		try {
			num = mybatis.selectOne("product.getSequence");
		}catch(Exception e) {
			num = 1000;
		}

		return num+1;
	}

	public void addImg(List<ProductImgDTO> pdto,int seq) {
		for(ProductImgDTO p : pdto) {
			Map<String,String> param = new HashMap();
			param.put("img_seq", ""+seq);
			param.put("oriName", p.getOriName());
			param.put("sysName", p.getSysName());
			mybatis.insert("product.addImg",param);
		}
	}

	public ProductDTO productDetail(int pseq){
		return mybatis.selectOne("product.productDetail",pseq);
	}

	public int addOption(OptionDTO odto) throws InterruptedException {
		int result = 0;

		result = mybatis.insert("product.addOption",odto);
		return result;
	}
	
	public int productDelete(int seq) {
		return mybatis.delete("product.productDelete",seq);
	}
	
	public List<String> getImg(int pseq) {
		return mybatis.selectList("product.getImg",pseq);
	}

	public void modifyImg(List<ProductImgDTO> pdto, int seq) {
		mybatis.delete("product.deleteImg",seq);
		for(ProductImgDTO p : pdto) {
			Map<String,String> param = new HashMap();
			param.put("img_seq", ""+seq);
			param.put("oriName", p.getOriName());
			param.put("sysName", p.getSysName());
			mybatis.insert("product.addImg",param);
		}
	}
	
	public void deleteOption(int seq) {
		mybatis.delete("product.deleteOption",seq);
	}

	public int productModify(int pseq,String pname, int price, String content, String category, String sysname) {
		Map<String,String> param = new HashMap();
//		ProductDTO pdto = new ProductDTO(pseq,pname,price,category, null,content,sysname, null, null);
		param.put("pseq", ""+pseq);
		param.put("pname", pname);
		param.put("price", ""+price);
		param.put("content", content);
		param.put("category", category);
		param.put("img", sysname);
		for(String key : param.keySet()) {
			System.out.println(param.get(key));
		}
		return mybatis.update("product.productModify",param);
	}

	public List<OptionDTO> getOption(int pseq) {
		return mybatis.selectList("product.getOption",pseq);
	}
	
	

}
