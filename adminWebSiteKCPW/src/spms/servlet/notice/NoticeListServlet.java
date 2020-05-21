package spms.servlet.notice;

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

import spms.dao.NoticeDao;
import spms.dto.NoticeDto;

@WebServlet(value="/admin/list")
public class NoticeListServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		
		try {
			
			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");
			
			NoticeDao noticeDao = new NoticeDao();
			
			noticeDao.setConnection(conn);
			
			ArrayList<NoticeDto> noticeList = null;
			
			noticeList = (ArrayList<NoticeDto>)noticeDao.noticeSelectList();
			
			req.setAttribute("noticeList", noticeList);
			
			RequestDispatcher dispatcher =
					req.getRequestDispatcher("/admin/NoticeListView.jsp");
			
			dispatcher.forward(req, res);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			req.setAttribute("error", e);
			
			RequestDispatcher dispatcher =
					req.getRequestDispatcher("/ErrorNoticeView.jsp");
			
			dispatcher.forward(req, res);
		}
	}
	
}
