package osf.spring.dto;

public class DailyLookDTO {
	private int d_seq;
	private String writer;
	private String instargram;
	private String contents;
	private int view_count;
	private int lice_count;
	private String sysname;
	private String oriname;
	
	public DailyLookDTO(int d_seq, String writer, String instargram, String contents, int view_count, int lice_count,
			String sysname, String oriname) {
		super();
		this.d_seq = d_seq;
		this.writer = writer;
		this.instargram = instargram;
		this.contents = contents;
		this.view_count = view_count;
		this.lice_count = lice_count;
		this.sysname = sysname;
		this.oriname = oriname;
	}
	public DailyLookDTO() {}
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
	public String getInstargram() {
		return instargram;
	}
	public void setInstargram(String instargram) {
		this.instargram = instargram;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getLice_count() {
		return lice_count;
	}
	public void setLice_count(int lice_count) {
		this.lice_count = lice_count;
	}
	public String getSysname() {
		return sysname;
	}
	public void setSysname(String sysname) {
		this.sysname = sysname;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	
}
