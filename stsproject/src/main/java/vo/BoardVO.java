package vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int idx, qaidx;
	private String title, content, filename, regdate, animaltype, section, date;
	private String qatitle, qacontent, qaanimaltype, qasection, qadate;
	
	
	public String getQadate() {
		return qadate;
	}

	public void setQadate(String qadate) {
		this.qadate = qadate;
	}

	public int getQaidx() {
		return qaidx;
	}

	public void setQaidx(int qaidx) {
		this.qaidx = qaidx;
	}

	public String getQatitle() {
		return qatitle;
	}

	public void setQatitle(String qatitle) {
		this.qatitle = qatitle;
	}

	public String getQacontent() {
		return qacontent;
	}

	public void setQacontent(String qacontent) {
		this.qacontent = qacontent;
	}

	public String getQaanimaltype() {
		return qaanimaltype;
	}

	public void setQaanimaltype(String qaanimaltype) {
		this.qaanimaltype = qaanimaltype;
	}

	public String getQasection() {
		return qasection;
	}

	public void setQasection(String qasection) {
		this.qasection = qasection;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getIdx() {
		return idx;
	}

	// 업로드 된 파일을 받기위한 클래스
	MultipartFile photo; // 파일에 사진 저장

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename; // 이름 저장
	}
	
	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getAnimaltype() {
		return animaltype;
	}

	public void setAnimaltype(String animaltype) {
		this.animaltype = animaltype;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

}
