package vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int idx;
	private String title, content, filename, date, animaltype, section;
	
	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public int getIdx() {
		return idx;
	}

	MultipartFile photo; // 파일에 사진 저장

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAnimaltype() {
		return animaltype;
	}

	public void setAnimaltype(String animaltype) {
		this.animaltype = animaltype;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public MultipartFile getPhoto() {
		
		return null;
	}

}
