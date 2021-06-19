package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;

public class MycomAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
	        request.setCharacterEncoding("utf-8");
	        String m_nickname = null;
	        int m_num = 0;
            HttpSession session = request.getSession();
            m_num = (int)session.getAttribute("m_num");
            BoardDao bd = BoardDao.getInstance();
            m_nickname = bd.getNickname(m_num);
	      
	        request.setAttribute("m_nickname", m_nickname);
	        request.setAttribute("m_num", m_num);
	        
	        int comType = Integer.parseInt(request.getParameter("comType"));
	        
	        if(comType == 1) { return "samsung.jsp"; }
	        else if (comType == 2) { return "coupang.jsp";}
	        else if (comType == 3) { return "delivery.jsp";}
	        else if (comType == 4) { return "line.jsp";}
	        else if (comType == 5) { return "kakao.jsp";}
	        else if (comType == 6) { return "toss.jsp";}
	        else if (comType == 7) { return "naver.jsp";}
	        else if (comType == 8) { return "carrot.jsp";}
	         
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }
		  return "";
	      
	}

}
