package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import spms.dto.MemberDto;

public class SangahDao {

	private Connection conn;

	public void setConnection(Connection conn) {
		this.conn = conn;
	}

	public List<MemberDto> selectList() throws Exception {
		
		System.out.println("들어왔니");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT MNO, MNAME, EMAIL, CRE_DATE";
		sql += " FROM MEMBER";
		sql += " ORDER BY MNO ASC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			ArrayList<MemberDto> memberList = new ArrayList<MemberDto>();
			
			int no = 0;
			String name = "";
			String email =  "";
			Date creDate = null;
			
			while (rs.next()) {
				no = rs.getInt("MNO");
				System.out.println(no);
				name = rs.getString("MNAME");
				email = rs.getString("EMAIL");
				creDate = rs.getDate("CRE_DATE");
				
				MemberDto memberDto = new MemberDto(no, name, email, creDate);
				System.out.println("member"+memberDto);
				
				memberList.add(memberDto);
			}
			
			return memberList;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
			
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			try {
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} //finally종료
	}
}
