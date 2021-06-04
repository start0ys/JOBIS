package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board;
import dao.BoardDao;

public class MyboardAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			//검색
			String s_type = "1";
			
			String search = request.getParameter("search");
			if (search == null || search.equals("")) { search = "0";}
			
			//게시판 목록가져오기
	        String m_nickname = null;
	        int m_num = 0;
            HttpSession session = request.getSession();
            m_num = (int)session.getAttribute("m_num");
            BoardDao bd = BoardDao.getInstance();
            m_nickname = bd.getNickname(m_num);
            
            int m_divide = bd.getM_divide(m_num);
            if (m_divide == 0) { 
            	request.setAttribute("m_nickname", m_nickname);
            	return "boardfail.jsp"; 
            }
	       
	         
	         
	        request.setAttribute("m_nickname", m_nickname);
	        request.setAttribute("m_num", m_num);
	        
	        //글목록 불러오기
	        int totCnt = bd.getTotal(search);
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) { pageNum = "1";}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			List<Board> list = bd.mylist(startRow,endRow,s_type,search);
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage - 1) / blockSize * blockSize + 1;
			int endPage = startPage + blockSize - 1;
			if ( endPage> pageCnt ) endPage = pageCnt;
		
			
			request.setAttribute("s_type", s_type);
			request.setAttribute("search", search);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "myboard.jsp";
	}

}
