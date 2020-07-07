package osf.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import osf.spring.dao.DailyLookDAO;
import osf.spring.dto.DailyLookDTO;
import osf.spring.statics.DailyConfiguration;

@Service
public class DailyLookService {
	
	@Autowired
	private DailyLookDAO ddao;
	
	@Transactional("txManager")
	public List<DailyLookDTO> select(int page) throws Exception{
		return ddao.select(page);
	}
	
	@Transactional("txManager")
	public String getPageNavi(int currentPage) throws Exception{
		int recordTotalCount = ddao.getArticleCount();
		int pageTotalCount = 0;
		
		if(recordTotalCount%DailyConfiguration.recordcountPerPage == 0) {
			pageTotalCount = recordTotalCount / DailyConfiguration.recordcountPerPage;
		}else {
			pageTotalCount = recordTotalCount / DailyConfiguration.recordcountPerPage + 1;
		}
		
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage - 1) / DailyConfiguration.naviCountPerPage * DailyConfiguration.naviCountPerPage + 1;
		int endNavi = startNavi + DailyConfiguration.naviCountPerPage - 1;
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		
		StringBuilder sb = new StringBuilder();
		
		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		
		for(int i = startNavi; i<=endNavi; i++) {
			sb.append("<a style=\"text-decoration: none; color: black;\" href=\"/daily/daily_list?page="+i+"\">"+i+"</a>  ");	
		}
		return sb.toString();
	}
	
	public DailyLookDTO selectOne(DailyLookDTO ddto) throws Exception{
		return ddao.selectOne(ddto);
	}
	
	@Transactional("txManager")
	public int insert(DailyLookDTO ddto) throws Exception{
		return ddao.insert(ddto);
	}
	
	@Transactional("txManager")
	public int delete(DailyLookDTO ddto) throws Exception{
		return ddao.delete(ddto);
	}
	
	@Transactional("txManager")
	public int update(DailyLookDTO ddto) throws Exception{
		return ddao.update(ddto);
	}
}
