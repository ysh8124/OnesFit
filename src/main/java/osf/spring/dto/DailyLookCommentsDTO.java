package osf.spring.dto;

import java.sql.Timestamp;

public class DailyLookCommentsDTO {
	private int c_seq;
	private int d_seq;
	private String writer;
	private String contents;
	private Timestamp write_date;
	
	public DailyLookCommentsDTO(int c_seq, int d_seq, String writer, String contents, Timestamp write_date) {
		super();
		this.c_seq = c_seq;
		this.d_seq = d_seq;
		this.writer = writer;
		this.contents = contents;
		this.write_date = write_date;
	}
	public DailyLookCommentsDTO() {}
	public int getC_seq() {
		return c_seq;
	}
	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}
	public int getD_seq() {
		return d_seq;
	}
	public void setD_seq(int d_seq) {
		this.d_seq = d_seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
}
