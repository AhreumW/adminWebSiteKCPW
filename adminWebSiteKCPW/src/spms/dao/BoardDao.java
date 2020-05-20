package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import spms.dto.BoardDto;
import spms.dto.MemberDto;

public class BoardDao {

	private Connection conn;

	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	/*
	 * -- 일반 게시판 관리 sql 수행문
	select board_no, title, content, email, cre_date
	from board
	order by board_no desc;
	
	select board_no, title, content, email, cre_date
	from board
	where board_no = 1;
	
	insert into board
	(board_no, title, content, email)
	values(board_no_seq.NEXTVAL, '제목', '내용', 'dd');
	
	update board
	set title='tt', content='content'
	where board_no = 1 and email='dd';
	
	select *
	from board;
	
	delete from board
	where board_no = 2 and email='dd';
	 * 
	 */
	public List<BoardDto> boardSelectList(){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardDto> boardList = null;
		String sql = "";
		
		try {
			sql = "SELECT BOARD_NO, TITLE, CONTENT, EMAIL, CRE_DATE";
			sql += " FROM BOARD";
			sql += " ORDER BY BOARD_NO DESC";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			boardList = new ArrayList<BoardDto>();
			
			int boardNo = 0;
			String title = "";
			String content = "";
			String email = "";
			Date creDate = null;
			
			while(rs.next()) {
				boardNo = rs.getInt("BOARD_NO");
				title = rs.getString("TITLE");
				content = rs.getString("CONTENT");
				email = rs.getString("EMAIL");
				creDate = rs.getDate("CRE_DATE");
				
				BoardDto boardDto = new BoardDto();
				boardDto.setBoardNo(boardNo);
				boardDto.setTitle(title);
				boardDto.setContent(content);
				boardDto.setEmail(email);
				boardDto.setCreatedDate(creDate);
				
				//System.out.println(boardDto.getBoardNo());
				
				boardList.add(boardDto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("boardSelectList 에러");
			e.printStackTrace();
		}finally {
			try {
	            if (pstmt != null) {
	               pstmt.close();
	            }

	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
			
			try {
	            if (rs != null) {
	               rs.close();
	            }

	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
		}
		
		return boardList;
	}
	
	
	public BoardDto boardSelectOne(int no){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		BoardDto boardDto = null;
		String sql = "";
		sql = "SELECT BOARD_NO, TITLE, CONTENT, EMAIL, CRE_DATE"; 
		sql += " FROM BOARD";
		sql += " WHERE BOARD_NO = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
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
	
	        	boardDto = new BoardDto();
	
	        	boardDto.setBoardNo(no);
	        	boardDto.setEmail(email);
	        	boardDto.setTitle(title);
	        	boardDto.setContent(content);
	        	boardDto.setCreatedDate(creDate);
	        	
	        }
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
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
		}
			
		
		return boardDto;
	}
	
	public int boardInsert(){
		
		return 0;
	}
	
	public int boardUpdate(BoardDto boardDto, String myEmail){
		
		int result = 0;
		
		PreparedStatement pstmt = null;
			
		String sql ="";
		sql += "UPDATE BOARD";
		sql += " SET TITLE=?, CONTENT=?";
		sql += " WHERE BOARD_NO=? AND EMAIL=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, boardDto.getTitle());
	        pstmt.setString(2, boardDto.getContent());
	        pstmt.setInt(3, boardDto.getBoardNo());
	        pstmt.setString(4, boardDto.getEmail());
			
	        result = pstmt.executeUpdate(sql);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("작성자 일치 확인");
			e.printStackTrace();
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
	
	public int boardDelete(){
		
		return 0;
	}
	
	public BoardDto boardExist(String title, String content, String email) {
		
		return null;
	}
}
