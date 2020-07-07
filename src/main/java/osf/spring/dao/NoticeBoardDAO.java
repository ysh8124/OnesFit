package osf.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import osf.spring.dto.NoticeBoardDTO;
import osf.spring.statics.Configuration;

@Repository
public class NoticeBoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<NoticeBoardDTO> select(int page) throws Exception{
		int start = page * Configuration.recordcountPerPage - (Configuration.recordcountPerPage - 1);
		int end = start + (Configuration.recordcountPerPage-1);
		
		Map<String,Integer> param = new HashMap();
		param.put("start", start);
		param.put("end",end);
		
		return mybatis.selectList("Notice.select", param);
	}
	public NoticeBoardDTO selectOne(NoticeBoardDTO ndto)throws Exception{
		return mybatis.selectOne("Notice.selectOne", ndto);
	}
	
	public int getArticleCount() throws Exception{
		return mybatis.selectOne("Notice.ArticleCount");
	}
	
	public int insert(NoticeBoardDTO ndto) throws Exception{
		return mybatis.insert("Notice.insert",ndto);
	}
	
	public int update(NoticeBoardDTO ndto)throws Exception{
		return mybatis.update("Notice.update",ndto);
	}
	
	public int delete(NoticeBoardDTO ndto)throws Exception{
		return mybatis.delete("Notice.delete",ndto);
	}
	
	public int modify(NoticeBoardDTO ndto)throws Exception{
		return mybatis.update("Notice.modify",ndto);
	}
	
	

}
