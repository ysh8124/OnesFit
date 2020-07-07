package osf.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import osf.spring.dto.DailyLookDTO;
import osf.spring.dto.NoticeBoardDTO;
import osf.spring.statics.Configuration;
import osf.spring.statics.DailyConfiguration;

@Repository
public class DailyLookDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(DailyLookDTO ddto) throws Exception{
		return mybatis.insert("Daily.insert",ddto);
	}
	
	public int delete(DailyLookDTO ddto) throws Exception{
		return mybatis.delete("Daily.delete",ddto);
	}
	
	public int update(DailyLookDTO ddto) throws Exception{
		return mybatis.update("Daily.update",ddto);
	}
	
	public List<DailyLookDTO> select(int page) throws Exception{
		int start = page * DailyConfiguration.recordcountPerPage - (DailyConfiguration.recordcountPerPage - 1);
		int end = start + (DailyConfiguration.recordcountPerPage-1);
		
		Map<String,Integer> param = new HashMap();
		param.put("start", start);
		param.put("end",end);
		
		return mybatis.selectList("Daily.select", param);
	}
	public DailyLookDTO selectOne(DailyLookDTO ddto) throws Exception{
		return mybatis.selectOne("Daily.selectOne", ddto);
	}
	
	public int getArticleCount() throws Exception{
		return mybatis.selectOne("Daily.ArticleCount");
	}
}
