package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ERBoard;
import dao.ERBoardDao;

public class ERContentAction implements CommandProcess{
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String m_nickname = null;
			int m_num = 0;
			HttpSession session = request.getSession();
			m_num = (int)session.getAttribute("m_num");
			ERBoardDao bd = ERBoardDao.getInstance();
			m_nickname = bd.getNickname(m_num);   
			ERBoard erboard = bd.erSelect(m_num);
			
			request.setAttribute("m_nickname", m_nickname);
			request.setAttribute("m_num", m_num);
			request.setAttribute("erboard", erboard);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	return "erukcontent.jsp";
}
}
