package spms.servlet.board;

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
import javax.servlet.http.HttpSession;

import spms.dao.BoardDao;
import spms.dao.MemberDao;
import spms.dto.BoardDto;
import spms.dto.MemberDto;
import sun.reflect.ReflectionFactory.GetReflectionFactoryAction;

@WebServlet(value="/board/list")
public class BoardListServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {

		Connection conn = null;
		
		ServletContext sc = this.getServletContext();
		conn = (Connection) sc.getAttribute("conn");
		
		BoardDao boardDao = new BoardDao();
		boardDao.setConnection(conn);
		
		ArrayList<BoardDto> boardList = null;	
		
		//게시글 전체 조회 
		//boardList = (ArrayList<BoardDto>) boardDao.boardSelectList();
		
		int total = 0;
		//게시글 전체 개수 조회
		total = boardDao.boardTotalCount();
		
		int pageNum = 0;	//페이지 개수 
		int currentNo = 0;	//선택 페이지 번호
		if(req.getParameter("currentNo") != null) {			
			currentNo = Integer.parseInt(req.getParameter("currentNo"));
//			System.out.println("get currentNo: "+currentNo);
		}else {
			currentNo = 1;
//			System.out.println("get currentNo: "+currentNo);
		}

		if(total % 10 == 0 ){
			pageNum = total/10;
		}else{
			pageNum = total/10 + 1;
		}
		
//		System.out.println("total : "+total);
//		System.out.println("pageNum : "+pageNum);
		
		//게시글 10개씩 조회 
		boardList = (ArrayList<BoardDto>) boardDao.boardSelectTen(currentNo);
		req.setAttribute("boardList", boardList);
		
		//페이지 개수 전달
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("currentNo", currentNo);
		
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("./BoardListView.jsp");
		
		dispatcher.forward(req, res);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
	}
	
	
}
