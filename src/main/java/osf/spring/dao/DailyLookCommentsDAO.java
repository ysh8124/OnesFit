package osf.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import osf.spring.dto.DailyLookCommentsDTO;

@Repository
public class DailyLookCommentsDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<DailyLookCommentsDTO> select(DailyLookCommentsDTO ddto) throws Exception{
		return mybatis.selectList("Comments.select",ddto);
	}
	public int insert(DailyLookCommentsDTO ddto) throws Exception{
		return mybatis.insert("Comments.insert",ddto);
	}
	public int delete(DailyLookCommentsDTO ddto) throws Exception{
		return mybatis.delete("Comments.delete",ddto);
	}
}
