package spms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.SangahDao;
import spms.dto.MemberDto;

@WebServlet(value="/member/list")
public class MemberListServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("doget");
		Connection conn = null;
		
		try {
			
			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");
			
			SangahDao memberDao = new SangahDao();
			
			memberDao.setConnection(conn);
			
			ArrayList<MemberDto> memberList = null;
			
			memberList = (ArrayList<MemberDto>)memberDao.selectList();
			
			
			System.out.println("list"+memberList);
			req.setAttribute("memberList", memberList);
			
			
			RequestDispatcher dispatcher = 
					req.getRequestDispatcher("/member/MemberListView.jsp");
			
			dispatcher.forward(req, res);
			
		} catch (Exception e) {
			// TODO: handle exception
			
			req.setAttribute("error", e);
			RequestDispatcher dispatcher =
					req.getRequestDispatcher("/Error.jsp");
			
			dispatcher.forward(req, res);
		}
	}

}
