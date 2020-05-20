package spms.dto;

import java.util.Date;

public class NoticeDto {

	private int noticeNo;
	private String title;
	private String content;
	private String email;
	private Date reg_date;
	
	public NoticeDto() {
		super();
	}
	
	public NoticeDto(int noticeNo, String title, String content, String email) {
		super();
		this.noticeNo = noticeNo;
		this.title = title;
		this.content = content;
		this.email = email;
	}
	
	public NoticeDto(int noticeNo, String title, String content, String email, Date reg_date) {
		super();
		this.noticeNo = noticeNo;
		this.title = title;
		this.content = content;
		this.email = email;
		this.reg_date = reg_date;
	}
	
	public int getBoardNo() {
		return noticeNo;
	}
	public void setBoardNo(int noticeNo) {
		this.noticeNo = noticeNo;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	@Override
	public String toString() {
		return "BoardDto [noticeNo=" + noticeNo + ", title=" + title + ", content=" + content + ", email=" + email
				+ ", reg_date=" + reg_date + "]";
	}
	
	
}
