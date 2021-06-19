package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Comment;
import dao.CommentDao;

public class ReUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			CommentDao cd = CommentDao.getInstance();
			Comment comment = cd.select(c_idx);
			
			request.setAttribute("comment", comment);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "bReupdate.jsp";
	}

}
