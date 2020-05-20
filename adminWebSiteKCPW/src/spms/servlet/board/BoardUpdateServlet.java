package spms.servlet.board;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.BoardDao;
import spms.dao.MemberDao;
import spms.dto.BoardDto;
import spms.dto.MemberDto;

@WebServlet("/board/update")
public class BoardUpdateServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Connection conn = null;
		
		try {
			int no = Integer.parseInt(req.getParameter("no"));
//			System.out.println(no);
			
			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");
			
			BoardDao boardDao = new BoardDao();
			boardDao.setConnection(conn);
			
			BoardDto boardDto = new BoardDto();
			boardDto = boardDao.boardSelectOne(no);
			
			System.out.println("no" +boardDto.getBoardNo() );
			
			req.setAttribute("boardDto", boardDto);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		RequestDispatcher rd = req.getRequestDispatcher("./BoardUpdateForm.jsp");
		rd.forward(req, res);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Connection conn = null;
		
		
	}
	
}
