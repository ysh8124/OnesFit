package osf.spring.dto;

import java.sql.Date;

public class QuestionDTO {
	private int bno; 	//글번호
	private int pseq;	//제품번호
	private String title;//글제목
	private String contents;	//내용
	private String writer;	//작성자
	private Date write_date;	//작성날짜
	private String answer_yn;
	
	public QuestionDTO() {
		super();
	}

	public QuestionDTO(int bno, int pseq, String title, String contents, String writer, Date write_date,
			String answer_yn) {
		super();
		this.bno = bno;
		this.pseq = pseq;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.write_date = write_date;
		this.answer_yn = answer_yn;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getAnswer_yn() {
		return answer_yn;
	}

	public void setAnswer_yn(String answer_yn) {
		this.answer_yn = answer_yn;
	}
	
	

		
}
