package spms.servlet;

import java.io.IOException;
import java.sql.Connection;

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

@WebServlet(value = "/auth/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

		RequestDispatcher rd = req.getRequestDispatcher("./LoginForm.jsp");
		rd.forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// 데이터베이스 관련 객체 변수 선언
		Connection conn = null; // 연결

		String email = req.getParameter("email");
		String pwd = req.getParameter("password");
		
		
		ServletContext sc = this.getServletContext();
		conn = (Connection) sc.getAttribute("conn");

		MemberDao memberDao = new MemberDao();
		memberDao.setConnection(conn);

		try {
			
			MemberDto memberDto = memberDao.memberLogin(email, pwd);

			if (memberDto != null) {
				System.out.println("확인");
				
				HttpSession session = req.getSession();
				session.setAttribute("memberDto", memberDto);
				
				//System.out.println("memberDto session grade:"+memberDto.getGrade());
				
				res.sendRedirect("../member/list");
			} else {
				RequestDispatcher rd = 
				req.getRequestDispatcher("../auth/LoginFail.jsp");
				rd.forward(req, res);
				
			}

			/*
			 * RequestDispatcher rd = req.getRequestDispatcher("./LoginFail.jsp");
			 * rd.forward(req, res);
			 * 
			 */

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
	
		}
		
	}

}
