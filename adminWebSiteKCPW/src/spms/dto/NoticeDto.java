package spms.dto;

import java.util.Date;

public class NoticeDto {

	private int noticeNo;
	private String title;
	private String content;
	private String email;
	private Date createdDate;
	
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
	
	public NoticeDto(int noticeNo, String title, String content, String email, Date createdDate) {
		super();
		this.noticeNo = noticeNo;
		this.title = title;
		this.content = content;
		this.email = email;
		this.createdDate = createdDate;
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
		return createdDate;
	}
	public void setReg_date(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	
	@Override
	public String toString() {
		return "BoardDto [noticeNo=" + noticeNo + ", title=" + title + ", content=" + content + ", email=" + email
				+ ", createdDate=" + createdDate + "]";
	}
	
	
}
