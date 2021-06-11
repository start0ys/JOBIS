package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.SeBoard;



public class BseContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			//
			 request.setCharacterEncoding("utf-8");
			 BoardDao bd = BoardDao.getInstance();
            String m_nickname = null;
            int m_num = 0;
             HttpSession session = request.getSession();
             m_num = (int)session.getAttribute("m_num");
             m_nickname = bd.getNickname(m_num);
          
            request.setAttribute("m_nickname", m_nickname);
            request.setAttribute("m_num", m_num);
            int bm_num = Integer.parseInt(request.getParameter("bm_num"));
            int s_type = bd.stype(bm_num);
            if(s_type == 0) {
            	request.setAttribute("s_nickname", bd.getNickname(bm_num));
            	return "bsefail.jsp";
            }
            //
            int totCnt  = bd.getTotalCnt1(bm_num);	// 37
			String pageNum = request.getParameter("pageNum");	
			if (pageNum==null || pageNum.equals("")) {	pageNum = "1";	}
			int currentPage = Integer.parseInt(pageNum);	
			int pageSize  = 10, blockSize = 10;
			// page = 2 -->  startRow = 11 , endRow = 20
			// page = 3 -->  startRow = 21 , endRow = 30
			int startRow = (currentPage - 1) * pageSize + 1;  // start -> 1
			int endRow   = startRow + pageSize - 1;           // start -> 10
			int startNum = totCnt - startRow + 1;
			List<SeBoard> list = bd.list2(startRow, endRow, bm_num);	
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
			int endPage = startPage + blockSize -1;	
			if (endPage > pageCnt) endPage = pageCnt;	
			
			request.setAttribute("s_nickname", bd.getNickname(bm_num));
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
		} catch(Exception e) { System.out.println(e.getMessage()); }
		return "bsecontent.jsp";
	}

}
