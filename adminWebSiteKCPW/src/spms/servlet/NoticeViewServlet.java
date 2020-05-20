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

import spms.dao.NoticeDao;
import spms.dto.NoticeDto;

@WebServlet(value="/notice/view")
public class NoticeViewServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		RequestDispatcher rd = null;
		
		
		try {
			
			ServletContext sc = this.getServletContext();
			
			conn = (Connection) sc.getAttribute("conn");
			
			int no = Integer.parseInt(req.getParameter("no"));
			
			NoticeDao noticeDao = new NoticeDao();
			noticeDao.setConnection(conn);
			
			NoticeDto noticeDto = noticeDao.noticeSelectOne(no);
			
			req.setAttribute("noticeDton", noticeDto);
			rd = req.getRequestDispatcher("./NoticeUpdateForm.jsp");
			
			rd.forward(req, res);
			
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
			
			req.setAttribute("error", e);
			rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, res);
		}
	}
	
}
