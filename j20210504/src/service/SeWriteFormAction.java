package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SeBoard;
import dao.SeBoardDao;

public class SeWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	  System.out.println("SeWriteFormAction Start...");
      try {
    	  //
    	  SeBoardDao bd = SeBoardDao.getInstance();
    	  request.setCharacterEncoding("utf-8");
          String m_nickname = null;
          int m_num = 0;
           HttpSession session = request.getSession();
           m_num = (int)session.getAttribute("m_num");
           m_nickname = bd.getNickname(m_num);
           
           request.setAttribute("m_nickname", m_nickname);
           request.setAttribute("m_num", m_num);
          //
			int s_idx = 0;
    		String pageNum = request.getParameter("pageNum");
    		if (pageNum == null) pageNum = "1";
			request.setAttribute("s_idx", s_idx);
			request.setAttribute("pageNum", pageNum);
		}catch(Exception e) {	
			System.out.println(e.getMessage());	
		}
      
	  return "SewriteForm.jsp";
	}

}
