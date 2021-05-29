package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board;
import dao.BoardDao;

public class BoardAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			int b_type = Integer.parseInt(request.getParameter("b_type"));
	        String m_nickname = null;
	        int m_num = 0;
            HttpSession session = request.getSession();
            m_num = (int)session.getAttribute("m_num");
            BoardDao bd = BoardDao.getInstance();
            m_nickname = bd.getNickname(m_num);
            
            int m_divide = bd.getM_divide(m_num);
            if (m_divide == 0) { return "boardfail.jsp"; }
	       
	         
	         
	        request.setAttribute("b_type", b_type);
	        request.setAttribute("m_nickname", m_nickname);
	        request.setAttribute("m_num", m_num);
	         
	        int totCnt = bd.getTotalCnt(b_type);
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) { pageNum = "1";}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			List<Board> list = bd.list(startRow,endRow,b_type);
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage - 1) / blockSize * blockSize + 1;
			int endPage = startPage + blockSize - 1;
			if ( endPage> pageCnt ) endPage = pageCnt;
			

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

		return "board.jsp";
	}

}