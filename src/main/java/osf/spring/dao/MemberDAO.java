package osf.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import osf.spring.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<MemberDTO> getMembers(){
		return mybatis.selectList("member.getMembers");
	}
	
	public int memberDelete(String id) {
		return mybatis.delete("member.memberDelete",id);
	}
	
	public int memberBlack(String id) {
		return mybatis.update("member.memberBlack",id);
	}
	
	public int updatePoint(String id,int point) {
		Map<String,String> param = new HashMap();
		param.put("id", id);
		param.put("point", ""+point);
		System.out.println(id+"/"+point);
		return mybatis.update("member.updatePoint",param);
	}
	
}
