package osf.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import osf.spring.dao.NoticeBoardDAO;
import osf.spring.dto.NoticeBoardDTO;
import osf.spring.statics.Configuration;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeBoardDAO ndao;
	
	@Transactional("txManager")
	public List<NoticeBoardDTO> select(int page)throws Exception{
		return ndao.select(page);
	}
	
	@Transactional("txManager")
	public String getPageNavi(int currentPage)throws Exception{
		int recordTotalCount = ndao.getArticleCount();
		int pageTotalCount = 0;
		
		if(recordTotalCount%Configuration.recordcountPerPage == 0) {
			pageTotalCount = recordTotalCount / Configuration.recordcountPerPage;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordcountPerPage + 1;
		}
		
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + Configuration.naviCountPerPage - 1;
		
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
		
		if(needPrev) {
			sb.append("<a style=\"text-decoration: none; color: black;\" href=\"/notice/notice_list?page="+(startNavi-1)+"\"> < </a>");
		}
		for(int i = startNavi; i<=endNavi; i++) {
			sb.append("<a style=\"text-decoration: none; color: black;\" href=\"/notice/notice_list?page="+i+"\">"+i+"</a>  ");	
		}
		if(needNext) {
			sb.append("<a style=\"text-decoration: none; color: black;\" href=\"/notice/notice_list?page="+(endNavi+1)+"\"> > </a>");
		}
		return sb.toString();
	}
	
	public NoticeBoardDTO selectOne(NoticeBoardDTO ndto)throws Exception{
		return ndao.selectOne(ndto);
	}
	
	@Transactional("txManager")
	public int update(NoticeBoardDTO ndto) throws Exception{
		return ndao.update(ndto);
	}
	
	@Transactional("txManager")
	public int insert(NoticeBoardDTO ndto)throws Exception{
		return ndao.insert(ndto);
	}
	@Transactional("txManager")
	public int delete(NoticeBoardDTO ndto)throws Exception{
		return ndao.delete(ndto);
	}
	@Transactional("txManager")
	public int modify(NoticeBoardDTO ndto)throws Exception{
		return ndao.modify(ndto);
	}
	
}
