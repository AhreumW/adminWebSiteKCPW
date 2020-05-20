package spms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value="/member/delete")
public class MemberDeleteServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req
			, HttpServletResponse res) 
					throws ServletException, IOException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		ServletContext sc = this.getServletContext();

		String mNo = req.getParameter("no");
		
		try {
			conn = (Connection) sc.getAttribute("conn");
			
			String sql = "DELETE FROM MEMBER ";
				   sql += "WHERE MNO = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mNo);		
			
			int resultNum = pstmt.executeUpdate();
			
			System.out.println("수행결과 : " + resultNum);
			
			res.sendRedirect("./list");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("insert into member 실패");
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("pstmt 종료 실패");
				}
			}

		} // finally end	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse res) 
					throws ServletException, IOException {
		
		System.out.println("나중에 여기서 삭제 처리하자");
		
	}
}
