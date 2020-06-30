package osf.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import osf.spring.dao.MemberDAO;
import osf.spring.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO mdao;
	
	public List<MemberDTO> getMembers(){
		return mdao.getMembers();
	}
	
	public int memberDelete(String id) {
		return mdao.memberDelete(id);
	}
	
	public int memberBlack(String id) {
		return mdao.memberBlack(id);
	}
	
	public int updatePoint(String id,int point) {
		return mdao.updatePoint(id,point);
	}
	
}
