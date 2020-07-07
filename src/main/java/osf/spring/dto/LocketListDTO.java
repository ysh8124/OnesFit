package osf.spring.dto;

public class LocketListDTO {
	
	private int seq;
	private String id;
	private String homename;
	private String takename;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	
	public LocketListDTO() {}
	public LocketListDTO(int seq, String id, String homename, String takename, String phone, String zipcode,
			String address1, String address2) {
		super();
		this.seq = seq;
		this.id = id;
		this.homename = homename;
		this.takename = takename;
		this.phone = phone;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHomename() {
		return homename;
	}
	public void setHomename(String homename) {
		this.homename = homename;
	}
	public String getTakename() {
		return takename;
	}
	public void setTakename(String takename) {
		this.takename = takename;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
}
