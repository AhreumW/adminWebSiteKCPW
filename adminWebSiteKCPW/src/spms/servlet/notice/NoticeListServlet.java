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
			
			int total = 0;
			//게시글 전체 개수 조회
			total = noticeDao.boardTotalCount();
			
			int pageNum = 0;	//페이지 개수 
			int currentNo = 0;	//선택 페이지 번호
			if(req.getParameter("currentNo") != null) {			
				currentNo = Integer.parseInt(req.getParameter("currentNo"));
//				System.out.println("get currentNo: "+currentNo);
			}else {
				currentNo = 1;
//				System.out.println("get currentNo: "+currentNo);
			}

			if(total % 10 == 0 ){
				pageNum = total/10;
			}else{
				pageNum = total/10 + 1;
			}
			
//			System.out.println("total : "+total);
//			System.out.println("pageNum : "+pageNum);
			
			noticeList = (ArrayList<NoticeDto>)noticeDao.noticeSelectList();
			
			req.setAttribute("noticeList", noticeList);
			
			//페이지 개수 전달
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("currentNo", currentNo);
			
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
