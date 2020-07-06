package osf.spring.dto;

public class BestProductDTO {

	private int product_num;
	private int price;
	private int rank;
	
	public BestProductDTO() {}
	public BestProductDTO(int product_num, int price, int rank) {
		super();
		this.product_num = product_num;
		this.price = price;
		this.rank = rank;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
}
