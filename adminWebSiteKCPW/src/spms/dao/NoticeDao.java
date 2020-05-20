package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
	public List<NoticeDto> noticeSelectList() throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT NOTICE_NO, TITLE, CONTENT, EMAIL, CRE_DATE";
		sql += " FROM NOTICEBOARD";
		sql += " ORDER BY NOTICE_NO DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			ArrayList<NoticeDto> noticeList = new ArrayList<NoticeDto>();
			
			int noticeNo = 0;
			String title = "";
			String content = "";
			String email = "";
			Date creDate = null;
			
			while (rs.next()) {
				noticeNo = rs.getInt("NOTICE_NO");
				title = rs.getString("TITLE");
				content = rs.getString("CONTENT");
				email = rs.getString("EMAIL");
				creDate = rs.getDate("CRE_DATE");
				
				NoticeDto noticeDto = 
						new NoticeDto(noticeNo, title, content, email, creDate);
				
				noticeList.add(noticeDto);
			}
			
			return noticeList;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		} finally {
	         try {
	             if (rs != null) {
	                rs.close();
	             }

	          } catch (SQLException e) {
	             // TODO Auto-generated catch block
	             e.printStackTrace();
	          }

	          try {
	             if (pstmt != null) {
	                pstmt.close();
	             }

	          } catch (SQLException e) {
	             // TODO Auto-generated catch block
	             e.printStackTrace();
	          }

	       } //finally 종료
		
		
		
	}
	
	
	public NoticeDto noticeSelectOne(){
		
		return null;
	}
	
	//게시글 쓰기
	public int noticeInsert(NoticeDto noticeDto, String myEmail) throws Exception{
		int result = 0;
		PreparedStatement pstmt = null;
		
		System.out.println("noticeInsert"+myEmail);
		
		try {
			String title = noticeDto.getTitle();
			String content = noticeDto.getContent();
			
			String sql = "INSERT INTO NOTICEBOARD";
			sql += " (NOTICE_NO, TITLE, CONTENT, EMAIL, CRE_DATE)";
			sql += " VALUES(NOTICE_NO_SEQ.NEXTVAL, ?, ?, ?, SYSDATE)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, myEmail);
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		} finally {

	         if (pstmt != null) {
	            try {
	               pstmt.close();
	            } catch (SQLException e) {
	               // TODO Auto-generated catch block
	               e.printStackTrace();
	            }
	         }
	      } // finally 종료
		
		return result;
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
