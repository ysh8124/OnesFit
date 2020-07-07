package osf.spring.dto;

public class AnswerDTO {
	private int aseq;
	private int parent_bno;
	private String contents;
	public AnswerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AnswerDTO(int aseq, int parent_bno, String contents) {
		super();
		this.aseq = aseq;
		this.parent_bno = parent_bno;
		this.contents = contents;
	}
	public int getAseq() {
		return aseq;
	}
	public void setAseq(int aseq) {
		this.aseq = aseq;
	}
	public int getParent_bno() {
		return parent_bno;
	}
	public void setParent_bno(int parent_bno) {
		this.parent_bno = parent_bno;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
}
