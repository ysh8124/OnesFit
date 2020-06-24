package osf.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import osf.spring.dto.ProductImgDTO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int productAdd(String pname,int price,String content, String category,String sysname) {
		Map<String,String> param = new HashMap();
		param.put("pname", pname);
		param.put("price", ""+price);
		param.put("content", content);
		param.put("category", category);
		param.put("img", sysname);
		return mybatis.insert("product.addProduct",param);	
	}
	
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

}
