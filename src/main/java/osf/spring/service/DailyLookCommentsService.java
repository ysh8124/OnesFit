package osf.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import osf.spring.dao.DailyLookCommentsDAO;
import osf.spring.dto.DailyLookCommentsDTO;


@Service
public class DailyLookCommentsService {
	
	@Autowired
	DailyLookCommentsDAO ddao;
	
	@Transactional("txManager")
	public int insert(DailyLookCommentsDTO ddto) throws Exception{
		return ddao.insert(ddto);
	}
	@Transactional("txManager")
	public int delete(DailyLookCommentsDTO ddto) throws Exception{
		return ddao.delete(ddto);
	}
	@Transactional("txManager")
	public List<DailyLookCommentsDTO> select(DailyLookCommentsDTO ddto) throws Exception{
		return ddao.select(ddto);
	}

}
