package spms.dao;

import java.sql.Connection;
import java.util.List;

import spms.dto.BoardDto;

public class BoardDao {

	private Connection conn;

	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	
	public List<BoardDto> boardSelectList(){
		
		return null;
	}
	
	
	public BoardDto boardSelectOne(){
		
		return null;
	}
	
	public int boardInsert(){
		
		return 0;
	}
	
	public int boardUpdate(){
			
		return 0;
	}
	
	public int boardDelete(){
		
		return 0;
	}
	
	public BoardDto boardExist(String title, String content, String email) {
		
		return null;
	}
}
