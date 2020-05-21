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
	
	//게시판 목록
	public List<NoticeDto> noticeSelectList() throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT NOTICE_NO, TITLE, CONTENT, EMAIL, CRE_DATE";
		sql += " FROM NOTICEBOARD";
		sql += " ORDER BY CRE_DATE DESC";
		
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
	
	//게시글 상세보기
	public NoticeDto noticeSelectOne(int noticeNo) throws Exception{
		
		NoticeDto noticeDto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT NOTICE_NO, TITLE, CONTENT, EMAIL, CRE_DATE";
		sql += " FROM NOTICEBOARD";
		sql += " WHERE NOTICE_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			rs = pstmt.executeQuery();
			
			String title = "";
			String content = "";
			String email = "";
			Date creDate = null;
			
			if (rs.next()) {
				title = rs.getString("TITLE");
				content = rs.getString("CONTENT");
				email = rs.getString("EMAIL");
				creDate = rs.getDate("CRE_DATE");
				
				noticeDto = new NoticeDto();
				
				noticeDto.setNoticeNo(noticeNo);
				noticeDto.setTitle(title);
				noticeDto.setContent(content);
				noticeDto.setEmail(email);
				noticeDto.setCreatedDate(creDate);
			} else {
				throw new Exception("해당 번호의 게시글을 찾을 수 없습니다.");
			}
			
		} catch (SQLException e) {
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

	    } // finally 종료
		
		return noticeDto;
	}
	
	//게시글 쓰기
	public int noticeInsert(NoticeDto noticeDto, String myEmail) throws Exception{
		int result = 0;
		PreparedStatement pstmt = null;
		
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
			
			if(result == 0) {
				System.out.println("공지 추가 실패 sql수행오류");
			}
			
			
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
	
	public int noticeUpdate(NoticeDto noticeDto, String myEmail) throws SQLException{
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE NOTICEBOARD";
		sql += " SET TITLE = ?, CONTENT = ?";
		sql += " WHERE NOTICE_NO = ? AND EMAIL = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, noticeDto.getTitle());
			pstmt.setString(2, noticeDto.getContent());
			pstmt.setInt(3, noticeDto.getNoticeNo());
			pstmt.setString(4, myEmail);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
	        throw e;
		} finally {
	         try {
	             if (pstmt != null) {
	                pstmt.close();
	             }
	          } catch (SQLException e) {
	             // TODO Auto-generated catch block
	             e.printStackTrace();
	          }

	    } // finally 종료
		
	    return result;
	}
	
	public int noticeDelete(int noticeNo, String myEmail) throws SQLException {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM NOTICEBOARD"; 
		sql += " WHERE NOTICE_NO = ? AND EMAIL = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			pstmt.setString(2, myEmail);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		} finally {

			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} // finally 종료

		return result;
	}
	
	public NoticeDto noticeExist(String title, String content, String email) {
		
		return null;
	}
}
