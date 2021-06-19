package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SeBoard;
import dao.SeBoardDao;

public class MyseAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SeBoardDao bd = SeBoardDao.getInstance();
		try {
			//
			 request.setCharacterEncoding("utf-8");
             String m_nickname = null;
             int m_num = 0;
              HttpSession session = request.getSession();
              m_num = (int)session.getAttribute("m_num");
              m_nickname = bd.getNickname(m_num);
           
             request.setAttribute("m_nickname", m_nickname);
             request.setAttribute("m_num", m_num);
             //
			int totCnt  = bd.getTotalCnt1(m_num);	// 37
			String pageNum = request.getParameter("pageNum");	
			if (pageNum==null || pageNum.equals("")) {	pageNum = "1";	}
			int currentPage = Integer.parseInt(pageNum);	
			int pageSize  = 10, blockSize = 10;
			// page = 2 -->  startRow = 11 , endRow = 20
			// page = 3 -->  startRow = 21 , endRow = 30
			int startRow = (currentPage - 1) * pageSize + 1;  // start -> 1
			int endRow   = startRow + pageSize - 1;           // start -> 10
			int startNum = totCnt - startRow + 1;
			List<SeBoard> list = bd.list2(startRow, endRow, m_num);	
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
			int endPage = startPage + blockSize -1;	
			if (endPage > pageCnt) endPage = pageCnt;	
		
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			 
			System.out.println("-----------------------------------------------");  // /ch16/list.do
			System.out.println("startNum-->" + startNum);  // /ch16/list.do
			System.out.println("totCnt-->" + totCnt);  // /ch16/list.do
			System.out.println("currentPage-->" + currentPage);  // /ch16/list.do
			System.out.println("blockSize-->" + blockSize);  // /ch16/list.do
			System.out.println("pageSize-->" + pageSize);  // /ch16/list.do
			System.out.println("pageCnt-->" + pageCnt);  // /ch16/list.do
			System.out.println("startPage-->" + startPage);  // /ch16/list.do
			System.out.println("endPage-->" + endPage);  // /ch16/list.do
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "myse.jsp";
	}

}
