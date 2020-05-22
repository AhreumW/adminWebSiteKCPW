package spms.servlet.auth;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dto.MemberDto;

@WebServlet("/auth/find")
public class FindPwdServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		RequestDispatcher rd = req.getRequestDispatcher("./FindPwdForm.jsp");
		rd.forward(req, res);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		
		MemberDto memberDto = new MemberDto(); 
		
		ServletContext sc = this.getServletContext();
		conn = (Connection) sc.getAttribute("conn");
		
		
	}
	
}
