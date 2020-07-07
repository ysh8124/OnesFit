package osf.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class NoticeBoardDTO {
	private int n_seq;
	private String writer;
	private String title;
	private String contents;
	private Timestamp write_date;
	private int view_count;
	private String sDate;
	
	
	public NoticeBoardDTO(int n_seq, String writer, String title, String contents, Timestamp write_date, int view_count,
			String sDate) {
		super();
		this.n_seq = n_seq;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.write_date = write_date;
		this.view_count = view_count;
		this.sDate = new SimpleDateFormat("yyyy-MM-dd").format(write_date);
	}
	
	public NoticeBoardDTO() {}
	
	public int getN_seq() {
		return n_seq;
	}
	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public String getsDate() {
	      
	      long write_date = this.write_date.getTime(); 
	      long current_date = System.currentTimeMillis();       
	      long gapTime = (current_date - write_date)/1000;
	      this.sDate=new SimpleDateFormat("yyyy-MM-dd").format(write_date);

	      if(gapTime<60) {
	         return "방금 전";
	      }else if(gapTime <300) {
	         return "5분 전";
	      }else if(gapTime <3600) {
	         return "1시간 전";
	      }else if(gapTime<86400) {
	         return "24시간 이내";
	      }else {
	         return sDate;         
	      }
	   }
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	

}
