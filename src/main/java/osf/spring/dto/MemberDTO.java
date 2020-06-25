package osf.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MemberDTO {

	private int mseq;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	private int point;
	private String blacklist_yn;
	private Timestamp recent_contact;
	private Timestamp regist_date;
	private String sDate;
	
	
	public MemberDTO() {}


	public MemberDTO(int mseq, String id, String pw, String name, String email, String phone, String zipcode,
			String address1, String address2, int point, String blacklist_yn, Timestamp recent_contact,
			Timestamp regist_date) {
		super();
		this.mseq = mseq;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.point = point;
		this.blacklist_yn = blacklist_yn;
		this.recent_contact = recent_contact;
		this.regist_date = regist_date;
	}




	public String getsDate() {
		long write_date = this.recent_contact.getTime(); //글이 쓰인 시점
		long current_date = System.currentTimeMillis(); //메서드 콜되는 현재시점

		long gapTime = (current_date  - write_date)/1000; //millisecond 이므로
		
		if(gapTime < 60) {
			return "방금 전";
		}else if(gapTime < 86400) {
			return "24시간 이내";
		}else {
			return sDate;
		}
	}


	public void setsDate(String sDate) {
		this.sDate = sDate;
	}


	public int getMseq() {
		return mseq;
	}


	public void setMseq(int mseq) {
		this.mseq = mseq;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
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


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public String getBlacklist_yn() {
		return blacklist_yn;
	}


	public void setBlacklist_yn(String blacklist_yn) {
		this.blacklist_yn = blacklist_yn;
	}


	public Timestamp getRecent_contact() {
		return recent_contact;
	}


	public void setRecent_contact(Timestamp recent_contact) {
		this.recent_contact = recent_contact;
	}


	public Timestamp getRegist_date() {
		return regist_date;
	}


	public void setRegist_date(Timestamp regist_date) {
		this.regist_date = regist_date;
	}



	
	
}
