package osf.spring.dto;

import java.sql.Timestamp;

public class ProductDTO {
	
	private int pseq;
    private String pname;
    private int price;
    private String category;
    private String best;
    private String content;
    private String title_img;
    private String soldout_yn;
    private Timestamp regist_date;
    
    public ProductDTO() {}
	public ProductDTO(int pseq, String pname, int price, String category, String best, String content, String title_img,
			String soldout_yn, Timestamp regist_date) {
		super();
		this.pseq = pseq;
		this.pname = pname;
		this.price = price;
		this.category = category;
		this.best = best;
		this.content = content;
		this.title_img = title_img;
		this.soldout_yn = soldout_yn;
		this.regist_date = regist_date;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBest() {
		return best;
	}
	public void setBest(String best) {
		this.best = best;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle_img() {
		return title_img;
	}
	public void setTitle_img(String title_img) {
		this.title_img = title_img;
	}
	public String getSoldout_yn() {
		return soldout_yn;
	}
	public void setSoldout_yn(String soldout_yn) {
		this.soldout_yn = soldout_yn;
	}
	public Timestamp getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(Timestamp regist_date) {
		this.regist_date = regist_date;
	}
    
    
	
}
