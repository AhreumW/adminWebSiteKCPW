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
import javax.servlet.http.HttpSession;

import javafx.scene.control.Alert;
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
				HttpSession session = req.getSession();
				session.setAttribute("memberDto", memberDto);
				
					System.out.println("나의 등급은 :" + memberDto.getGrade());
					if (memberDto.getGrade().equals("user")) {
						res.sendRedirect("../");
					} else {
						res.sendRedirect("../admin/member/list");
					}
				
				
			} else {
				RequestDispatcher rd = 
				req.getRequestDispatcher("../auth/LoginFail.jsp");
				rd.forward(req, res);
				
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
	
		}
		
	}

}
