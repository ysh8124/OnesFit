package osf.spring.dto;

public class ImageDTO {
	private int product_seq;
	private String oriname;
	private String sysname;
	
	
	public ImageDTO(int product_seq, String oriname, String sysname) {
		super();
		this.product_seq = product_seq;
		this.oriname = oriname;
		this.sysname = sysname;
	}
	public ImageDTO() {}
	public int getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getSysname() {
		return sysname;
	}
	public void setSysname(String sysname) {
		this.sysname = sysname;
	}
	
	
}
