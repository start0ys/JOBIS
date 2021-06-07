package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;

public class BwriteAction implements CommandProcess {

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
             request.setAttribute("b_type", Integer.parseInt (request.getParameter("b_type")));
             
             String ib = "최종학력 : \r\n"
             		+ "전공 : \r\n"
             		+ "대외활동 : \r\n"
             		+ "경력 : \r\n"
             		+ "자격증 : \r\n"
             		+ "기억나는 질문 : \r\n"
             		+ "내가 한 대답 : \r\n"
             		+ "면접관 분위기 : \r\n ";
            
             request.setAttribute("ib", ib);
             
          } catch (Exception e) {
             System.out.println(e.getMessage());
          }
           return "bwrite.jsp";
	}

}
