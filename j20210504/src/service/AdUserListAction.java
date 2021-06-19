package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board;
import dao.BoardDao;
import dao.User;
import dao.UserDao;

public class AdUserListAction implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao ud = UserDao.getInstance();
		try {
			//세션작업
			request.setCharacterEncoding("utf-8");
	        String m_nickname = null;
	        int m_num = 0;
            HttpSession session = request.getSession();
            m_num = (int)session.getAttribute("m_num");
            BoardDao bd = BoardDao.getInstance();
            m_nickname = bd.getNickname(m_num);
            
            
            
	        request.setAttribute("m_num", m_num);	      
	        request.setAttribute("m_nickname", m_nickname);

	        
	        
			int touCnt  = ud.getTotalUser();	
			String pageNum = request.getParameter("pageNum");	
			if (pageNum==null || pageNum.equals("")) {	pageNum = "1";	}
			int currentPage = Integer.parseInt(pageNum);	
			int pageSize  = 15, blockSize = 10;
			// page = 2 -->  startRow = 11 , endRow = 20
			// page = 3 -->  startRow = 21 , endRow = 30
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow   = startRow + pageSize - 1;
			int startNum = touCnt - startRow + 1;
			List<User> list = ud.list(startRow, endRow);	
			int pageCnt = (int)Math.ceil((double)touCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
			int endPage = startPage + blockSize -1;	
			if (endPage > pageCnt) endPage = pageCnt;
			
			request.setAttribute("touCnt", touCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
			
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "adUserList.jsp";
	}

}
