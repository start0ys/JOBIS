package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.Comment;
import dao.CommentDao;

public class ReUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			
			String c_content = request.getParameter("c_content");
			
			CommentDao cd = CommentDao.getInstance();
			
			int result = cd.update(c_idx,c_content);
			
			request.setAttribute("c_idx", c_idx);
			request.setAttribute("result", result);
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "bReupdatePro.jsp";
	}

}
