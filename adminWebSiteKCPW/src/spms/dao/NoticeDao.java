package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import spms.dto.BoardDto;
import spms.dto.NoticeDto;

public class NoticeDao {

	private Connection conn;

	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	/*
	 * -- 공지 게시판 관리 sql 수행문
		select notice_no, title, content, cre_date
		from noticeboard
		order by notice_no desc;
		
		select notice_no, title, content, cre_date
		from noticeboard
		where notice_no = 1;
		
		insert into noticeboard
		(notice_no, title, content, email)
		values(notice_no_seq.NEXTVAL, '제목', '내용', 'dd');
		
		update noticeboard
		set title='tt', content='content'
		where notice_no = 1 and email='dd';
		
		select *
		from noticeboard;
		
		delete from noticeboard
		where notice_no = 2 and email='dd';
	 * 
	 */
	public List<NoticeDto> noticeSelectList(){
	
		return null;
	}
	
	
	public NoticeDto noticeSelectOne(){
		
		return null;
	}
	
	public int noticeInsert(){
		
		return 0;
	}
	
	public int noticeUpdate(){
			
		return 0;
	}
	
	public int noticeDelete(){
		
		return 0;
	}
	
	public NoticeDto noticeExist(String title, String content, String email) {
		
		return null;
	}
}
