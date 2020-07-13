package osf.spring.dto;

public class PopupDTO {
	private int popup_seq;
	private String title;
	private String sysfileName;
	private String show_yn;
	public PopupDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PopupDTO(int popup_seq, String title, String sysfileName, String show_yn) {
		super();
		this.popup_seq = popup_seq;
		this.title = title;
		this.sysfileName = sysfileName;
		this.show_yn = show_yn;
	}
	public int getPopup_seq() {
		return popup_seq;
	}
	public void setPopup_seq(int popup_seq) {
		this.popup_seq = popup_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSysfileName() {
		return sysfileName;
	}
	public void setSysfileName(String sysfileName) {
		this.sysfileName = sysfileName;
	}
	public String getShow_yn() {
		return show_yn;
	}
	public void setShow_yn(String show_yn) {
		this.show_yn = show_yn;
	}
	
	
	
}
