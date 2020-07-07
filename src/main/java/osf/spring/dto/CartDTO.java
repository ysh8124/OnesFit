package osf.spring.dto;

public class CartDTO {
	private int c_seq;
	private String parent_id;
	private int pseq;
	private String pname;
	private String title_img;
	private String option1;
	private String option2;
	private int count_item;
	private int price;
	
	
	public CartDTO(int c_seq, String parent_id, int pseq, String pname, String title_img, String option1,
			String option2, int count_item, int price) {
		super();
		this.c_seq = c_seq;
		this.parent_id = parent_id;
		this.pseq = pseq;
		this.pname = pname;
		this.title_img = title_img;
		this.option1 = option1;
		this.option2 = option2;
		this.count_item = count_item;
		this.price = price;
	}
	public CartDTO() {}
	public int getC_seq() {
		return c_seq;
	}
	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getTitle_img() {
		return title_img;
	}
	public void setTitle_img(String title_img) {
		this.title_img = title_img;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public int getCount_item() {
		return count_item;
	}
	public void setCount_item(int count_item) {
		this.count_item = count_item;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
}