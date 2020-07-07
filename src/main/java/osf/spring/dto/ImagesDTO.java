package osf.spring.dto;

import org.springframework.web.multipart.MultipartFile;

public class ImagesDTO {
	private MultipartFile[] images;

	public ImagesDTO() {}
	
	public ImagesDTO(MultipartFile[] images) {
		super();
		this.images = images;
	}

	public MultipartFile[] getImages() {
		return images;
	}

	public void setImages(MultipartFile[] images) {
		this.images = images;
	}
	
	
}