package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class BupdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			Board board = new Board();
			
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			board.setM_num(Integer.parseInt(request.getParameter("m_num")));
			board.setM_nickname(request.getParameter("m_nickname"));
			board.setB_title(request.getParameter("b_title"));
			board.setB_content(request.getParameter("b_content"));
			board.setB_idx(Integer.parseInt(request.getParameter("b_idx")));
			
			BoardDao bd = BoardDao.getInstance();
			
			int result = bd.update(board);
			
			
			request.setAttribute("result", result);
			request.setAttribute("b_idx", board.getB_idx());
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "bupdatePro.jsp";
	}

}
