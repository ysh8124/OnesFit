package osf.spring.dto;

public class ProductImgDTO {
	private int img_seq;
	private String oriName;
	private String sysName;
	public ProductImgDTO(int img_seq, String oriName, String sysName) {
		super();
		this.img_seq = img_seq;
		this.oriName = oriName;
		this.sysName = sysName;
	}
	public int getImg_seq() {
		return img_seq;
	}
	public void setImg_seq(int img_seq) {
		this.img_seq = img_seq;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	
	
}
