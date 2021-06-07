package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board;
import dao.BoardDao;

public class BupdateAction implements CommandProcess {

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
			
			
			
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			String pageNum = request.getParameter("pageNum");
			Board board = bd.select(b_idx);
			
			
			request.setAttribute("b_type", board.getB_type());
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "bupdate.jsp";
	}

}
