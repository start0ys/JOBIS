package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SeBoard;
import dao.SeBoardDao;

public class SeDeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.parameter -> num, pageNum
		// 2.BoardDao bd 생성
		// 3.Board board = bd.select(num);
		// 4.request -> num, pageNum, board 저장
		try {
			int s_idx = Integer.parseInt(request.getParameter("s_idx"));
			String pageNum = request.getParameter("pageNum");
			SeBoardDao bd = SeBoardDao.getInstance();
			SeBoard Seboard = bd.select(s_idx);
			request.setAttribute("s_idx", s_idx);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("Seboard", Seboard);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "Sedeleteform.jsp";
	}

}
