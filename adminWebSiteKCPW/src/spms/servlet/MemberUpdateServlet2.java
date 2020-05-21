package spms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spms.dao.MemberDao;
import spms.dto.MemberDto;

@SuppressWarnings("serial")
@WebServlet(urlPatterns= {"/member/update1"})
public class MemberUpdateServlet2 extends HttpServlet {

	//이젠 너도 필요없어
	@Override
	protected void doGet(HttpServletRequest req, 
			HttpServletResponse res) 
					throws ServletException, IOException {
		Connection conn = null;
		RequestDispatcher rd = null;

		String mNo = "";

		try {

			ServletContext sc = this.getServletContext();

			conn = (Connection) sc.getAttribute("conn");
			
			rd = req.getRequestDispatcher("./MemberUpdateForm.jsp");
			rd.forward(req, res);

		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			req.setAttribute("error", e);
			rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, res);
		}
	} // do get end
	
	@Override
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse res) 
					throws ServletException, IOException {
		MemberDto memberDto = null;			
		Connection conn = null;
		
		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");

			
			int no = Integer.parseInt(req.getParameter("no"));
			String email = req.getParameter("email");
			String name = req.getParameter("name");
			
			Date modifiedDate = new Date();
			
			MemberDao memberDao = new MemberDao();
			memberDao.setConnection(conn);
			
			memberDto = new MemberDto(no, name, email, modifiedDate);
			int result = memberDao.memberUpdate(memberDto);
			
			if(result == 0) {
				System.out.println("회원 정보 조회가 실패하였습니다.");
			}
			res.sendRedirect("./list");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			req.setAttribute("error", e);
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, res);
		}
		
	} // doPost end
}
